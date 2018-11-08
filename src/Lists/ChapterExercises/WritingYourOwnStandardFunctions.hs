module Lists.ChapterExercises.WritingYourOwnStandardFunctions where

-- Question 1
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x : xs)
  | x = True
  | otherwise = myOr xs

-- Question 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x : xs)
  | f x = True
  | otherwise = myAny f xs

-- Question 3
myElem :: Eq a => a -> [a] -> Bool
myElem x = myAny (==x)

-- Question 4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]

-- Question 5
squish :: [[a]] -> [a]
squish [] = []
squish (x : xs) = x ++ squish xs

-- Question 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x : xs) = f x ++ squishMap f xs

-- Question 7
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- Question 8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [x] = x
myMaximumBy f (x : xs) = case f x y of
                           GT -> x
                           otherwise -> y
                         where y = myMaximumBy f xs

-- Question 9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [x] = x
myMinimumBy f (x : xs) = case f x y of
                           LT -> x
                           otherwise -> y
                         where y = myMinimumBy f xs

-- Question 10
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

-- Question 11
myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
