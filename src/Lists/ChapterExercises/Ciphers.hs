module Lists.ChapterExercises.Ciphers where

import Data.Char

chars :: [Char]
chars = ['a'..'z'] ++ ['A'..'Z']

caesar :: Int -> String -> String
caesar _ "" = ""
caesar n (x : xs)
  | not $ x `elem` chars = x : caesar n xs
  | otherwise = let base = if isUpper x then ord 'A' else ord 'a'
                    x' = chr $ ((ord x + n) - base) `mod` 26 + base
                in x' : caesar n xs

unCaesar :: Int -> String -> String
unCaesar _ "" = ""
unCaesar n (x : xs)
  | not $ x `elem` chars = x : unCaesar n xs
  | otherwise = let base = if isUpper x then ord 'A' else ord 'a'
                    x' = chr $ ((ord x - n) - base) `mod` 26 + base
                in x' : unCaesar n xs
