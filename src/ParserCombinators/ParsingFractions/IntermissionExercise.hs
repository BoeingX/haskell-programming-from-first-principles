module ParserCombinators.ParsingFractions.IntermissionExercise where

import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

parseInteger :: Parser Integer
parseInteger = do
    a <- integer
    b <- eof
    return a
