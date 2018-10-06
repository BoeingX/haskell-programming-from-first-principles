module ParserCombinators.ChapterExercises.LogFile where

import Control.Applicative
import Data.List
import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

-- Some types
type Year = Integer
type Month = Integer
type Day = Integer

data Date = Date Year Month Day
    deriving (Show, Eq)

type Hour = Integer
type Minute = Integer

data Time = Time Hour Minute
    deriving (Show, Eq)

type StartTime = Time
type Name = String
type Duration = Double

data Activity = Activity StartTime Name
    deriving (Show, Eq)

data Daily = Daily Date [Activity]
    deriving (Show, Eq)

-- Parsing
comment :: Parser String
comment = try (spaces >> string "--" >> many (noneOf "\n"))

eol :: Parser ()
eol = (newline >> return ()) <|> (comment >> return ())

-- This function is tricky
-- We have to 1) ignore comments started with -- and all white spaces before
--            2) handle correctly a single dash
parseName :: Parser String
parseName =  (eof >> return "")
         <|> (eol >> return "")
         <|> (liftA2 (:) anyChar parseName)

parseDate :: Parser Date
parseDate = do
    string "# "
    year <- integer
    char '-'
    month <- integer
    char '-'
    day <- integer
    many newline
    return $ Date year month day
    
parseTime :: Parser Time
parseTime = do
    hour <- integer
    char ':'
    minute <- integer
    return $ Time hour minute

parseActivity :: Parser Activity
parseActivity = do
    startTime <- parseTime
    -- integer consumes the trailing zero
    -- so `_ <- char ' '` gives an error
    skipMany (char ' ')
    name <- parseName
    skipMany eol
    return $ Activity startTime name

parseDaily :: Parser Daily
parseDaily = do
    date <- parseDate
    skipMany eol
    activities <- some parseActivity
    return $ Daily date activities

parseLog :: Parser [Daily]
parseLog = skipMany eol >> some parseDaily

-- Group by the first component and aggregate the second component
-- with a binary operator
groupByOp :: Eq a => (b -> b -> b) -> [(a, b)] -> [(a, b)]
groupByOp op = map reduce . groupBy (\a a' -> fst a == fst a')
    where reduce = liftA2 (,) (head . map fst) (foldr1 op . map snd)

dailySummary :: Daily -> [(Name, Duration)]
dailySummary (Daily _ activities) = nameDurations
    where getDuration (Activity t1 n1) (Activity t2 _) = (n1, timeDiff t1 t2)
          timeDiff (Time h1 m1) (Time h2 m2) = fromIntegral $ (h2 * 60 + m2) - (h1 * 60 + m1)
          nameDurations = groupByOp (+) $ sortOn fst $ zipWith getDuration activities (tail activities)

summary :: [Daily] -> [(Name, Duration)]
summary = groupByOp (+) . sortOn fst . concatMap dailySummary

-- Average time spent on each activity
avgTime :: [Daily] -> [(Name, Duration)]
avgTime xs = map (\(name, duration) -> (name, duration / len)) $ summary xs
    where len = fromIntegral $ length xs
