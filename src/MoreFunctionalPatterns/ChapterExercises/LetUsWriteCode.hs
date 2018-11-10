module MoreFunctionalPatterns.ChapterExercises.LetUsWriteCode where

-- Question 1
tensDigit :: Integral a => a -> a
tensDigit x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10


hunsDigit :: Integral a => a -> a
hunsDigit x = d
    where xLast = x `div` 100
          d     = xLast `mod` 10

-- Question 2
foldBool :: a -> a -> Bool -> a
foldBool x y z = case z of
                   True -> x
                   _    -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y z
  | z = x
  | otherwise = y

-- Question 3
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

-- Question 5
roundTrip :: (Show a, Read a) => a -> a
roundTrip = read . show

-- Question 6
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show
