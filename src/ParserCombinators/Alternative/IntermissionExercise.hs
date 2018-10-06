module ParserCombinators.Alternative.IntermissionExercise where

import Control.Applicative
import Data.Ratio ((%))
import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

parseFraction :: Parser Rational
parseFraction = do
    numerator <- decimal
    char '/'
    denominator <- decimal
    case denominator of
        0 -> fail "Denominator cannot be zero"
        _ -> return (numerator % denominator)

type IntegerOrRational = Either Rational Integer

parseIor :: Parser IntegerOrRational
parseIor = try (Left <$> parseFraction) <|> try (Right <$> decimal)
-- This will not work
-- parseIor = (Left <$> parseFraction) <|> (Right <$> decimal)
