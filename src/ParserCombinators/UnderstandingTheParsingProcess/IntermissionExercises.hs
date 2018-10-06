module ParserCombinators.UnderstandingTheParsingProcess.IntermissionExercises where

import Control.Applicative
import Text.Trifecta
import Text.Parser.Combinators

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    -- TODO: better handling the Failure case
    Failure a == Failure b = True
    _ == _ = False

-- Question 1
one :: Parser ()
one = char '1' >> eof

oneTwo :: Parser ()
oneTwo = char '1' >> char '2' >> eof

-- Question 2
oneTwoThree :: Parser String
oneTwoThree = choice [string "123", string "12", string "1"]
-- or
-- oneTwoThree = string "123" <|> string "12" <|> string "1"

-- Question 3
string' :: (CharParsing m) => String -> m String
string' = traverse char
