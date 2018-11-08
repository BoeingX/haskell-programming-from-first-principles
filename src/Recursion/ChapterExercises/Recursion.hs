module Recursion.ChapterExercises.Recursion where

sumToN :: (Eq a, Num a) => a -> a
sumToN 1 = 1
sumToN n = n + sumToN (n - 1)

multiply :: (Integral a) => a -> a -> a
multiply 0 _ = 0
multiply _ 0 = 0
multiply x y
  | x > y = multiply y x
  | y < 0 = multiply (-x) (-y)
  | x < 0 = -multiply (-x) y
  | x == 1 = y 
  | otherwise = y + multiply (x - 1) y
