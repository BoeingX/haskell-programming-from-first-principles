module Testing.ConventionalTesting.IntermissionExercise where

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

multiply :: (Integral a, Ord a) => a -> a -> a
multiply x y
  | x > y     = multiply y x
  | x == 0    = 0
  | x < 0     = - multiply (-x) y
  | otherwise = y + multiply (x - 1) y
