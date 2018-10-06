module ParserCombinators.ChapterExercises.SemanticVersions where

import Control.Applicative
import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

data NumberOrString = NOSS String | NOSI Integer
    deriving (Eq, Show)

instance Ord NumberOrString where
    NOSS s1 <= NOSS s2 = s1 <= s2
    NOSI n1 <= NOSI n2 = n1 <= n2
    NOSI _ <= NOSS _ = True
    _ <= _ = False

type Major = Integer
type Minor = Integer
type Patch = Integer
type Release = [NumberOrString]
type Metadata = [NumberOrString]

data SemVer = SemVer Major Minor Patch Release Metadata
    deriving (Eq, Show)

instance Ord SemVer where
    SemVer major minor patch release _ <= SemVer major' minor' patch' release' _
      | major < major' = True
      | minor > major' = False
      | minor < minor' = True
      | minor > minor' = False
      | patch < patch' = True
      | patch > patch' = False
      | null release' = True
      | null release = False
      | otherwise = release <= release'


-- Custom version of `integer`
-- This is necessary because by default
-- `+7` will be parsed as `7` by `integer`
parseInteger :: Parser Integer
parseInteger = do
    digits <- some digit
    -- leading zero
    if length digits >= 2 && head digits == '0' then
        fail "Leading zero" 
    else 
        return $ read digits

parseNos :: Parser NumberOrString
parseNos = NOSS <$> some letter <|> NOSI <$> parseInteger

parseNosSome :: Parser [NumberOrString]
parseNosSome = some (skipMany (char '.') >> parseNos)

parseSemVer :: Parser SemVer
parseSemVer = do
    major <- parseInteger
    _ <- char '.'
    minor <- parseInteger 
    _ <- char '.'
    patch <- parseInteger 
    release <- option [] (char '-' *> parseNosSome)
    metadata <- option [] (char '+' *> parseNosSome)
    -- or
    -- release <- (char '-' >> parseNosSome) <|> pure []
    -- metadata <- (char '+' >> parseNosSome) <|> pure []
    eof
    return $ SemVer major minor patch release metadata
