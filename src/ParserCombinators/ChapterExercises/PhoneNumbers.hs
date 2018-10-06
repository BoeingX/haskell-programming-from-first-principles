module ParserCombinators.ChapterExercises.PhoneNumbers where

import Control.Applicative
import Data.List
import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

type NumberingPlanArea = Int -- aka area code
type Exchange = Int
type LineNumber = Int

data PhoneNumber =
    PhoneNumber NumberingPlanArea Exchange LineNumber
    deriving (Eq, Show)

number :: String -> Int
number = foldl' (\acc x -> acc * 10 + read [x]) 0 

parseNumberingPlanArea :: Parser NumberingPlanArea
parseNumberingPlanArea = do
    _ <- optional (string "1-")
    numberingPlanArea   <-  char '(' *> count 3 digit <* char ')' <* char ' '
                        <|> (count 3 digit <* optional (char '-'))
    return $ number numberingPlanArea

parseExchange :: Parser Exchange
parseExchange = number <$> count 3 digit

parseLineNumber :: Parser LineNumber
parseLineNumber = number <$> count 4 digit

parsePhone :: Parser PhoneNumber
parsePhone = do
    numberingPlanArea <- parseNumberingPlanArea
    exchange <- parseExchange
    _ <- optional (char '-')
    lineNumber <- parseLineNumber
    return $ PhoneNumber numberingPlanArea exchange lineNumber
