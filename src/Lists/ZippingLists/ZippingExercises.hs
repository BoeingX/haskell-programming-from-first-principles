module Lists.ZippingLists.ZippingExercises where

-- Question 1
zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

-- Question 2
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- Question 3
zip'' :: [a] -> [b] -> [(a, b)]
zip'' = zipWith' (,)
