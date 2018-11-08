module Recursion.ChapterExercises.McCarthy91Function where

mc91 :: Integer -> Integer
mc91 n
  | n > 100 = n - 10
  | otherwise = mc91 $ mc91 $ n + 11
