module ParserCombinators.ChapterExercises.ParseDigitAndInteger where

import Control.Applicative
import Data.List
import Text.Trifecta

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

parseDigit :: Parser Char
parseDigit = oneOf $ concatMap show [0..9]

readChar :: (Read a) => Char -> a
readChar a = read [a]

base10Integer :: Parser Integer
base10Integer = do
    -- (<?>) give parser a name
    -- See https://hackage.haskell.org/package/parsers-0.12.9/docs/Text-Parser-Combinators.html
    digits <- some parseDigit <?> "integer"
    return $ (foldl1' (\acc x -> 10 * acc + x) . map readChar) digits

base10Integer' :: Parser Integer
base10Integer' =  (char '+' >> base10Integer) 
              <|> (char '-' >> base10Integer >>= \x -> return (-x))
              <|> base10Integer
