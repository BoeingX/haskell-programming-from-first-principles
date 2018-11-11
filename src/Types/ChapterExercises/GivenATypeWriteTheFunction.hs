module Types.ChapterExercises.GivenATypeWriteTheFunction where

-- Question 1
i :: a -> a
-- or i = id
i a = a

-- Question 2
c :: a -> b -> a
-- or c = const
c a _ = a

-- Question 3
c'' :: b -> a -> b
c'' = c

-- Question 4
c' :: a -> b -> b
c' _ b = b

-- Question 5
r :: [a] -> [a]
r = id
r' :: [a] -> [a]
r' = reverse

-- Question 6
co :: (b -> c) -> (a -> b) -> (a -> c)
co f g = f . g

-- Question 7
a :: (a -> c) -> a -> a
a _ x = x

-- Question 8
a' :: (a -> b) -> a -> b
a' f x = f x
