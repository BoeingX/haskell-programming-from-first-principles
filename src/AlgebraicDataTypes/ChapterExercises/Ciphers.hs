module AlgebraicDataTypes.ChapterExercises.Ciphers where

import Data.List
import Data.Char

-- Repeat the keyword for as many characters as there are in the original message
calculateCompanion :: String -> String -> String
calculateCompanion message keyword = (snd . foldl' f (0, "")) message
    where len = length keyword
          f (i, s) c
            | c == ' ' = (i, s ++ " ")
            | otherwise = (i + 1 `mod` len, s ++ [keyword !! i'])
                            where i' = i `mod` len

-- The core of the Vigenere cipher
shift :: Char -> Char -> Char
shift c c'
  | c' == ' ' = c
  | otherwise = c''
        where diff = ord c' - ord 'A'
              c'' = chr $ ((ord c - ord 'A' + diff) `mod` 26) + ord 'A'

-- API
vigenereCipher :: String -> String -> String
vigenereCipher message keyword = zipWith shift message companion
    where companion = calculateCompanion message keyword
