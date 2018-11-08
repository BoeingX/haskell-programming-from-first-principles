module Recursion.ChapterExercises.FixingDividedBy where

data DividedResult = Result Integer | DividedByZero
    deriving (Eq, Show)

div' :: Integer -> Integer -> DividedResult
div' _ 0 = DividedByZero
div' 0 _ = Result 0
div' x y
  | x < 0 && y < 0 = div' (-x) (-y)
div' x y
  | x < 0 = let Result z = div' (x + y) y
            in Result $ -1 + z
  | y < 0 = let Result z = div' (x + y) y
            in Result $ -1 + z
div' x y
  | x < y = Result 0
  | otherwise = let Result z = div' (x - y) y
                in Result $ 1 + z
