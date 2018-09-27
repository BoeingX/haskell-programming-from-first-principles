module Foldable.SomeBasicDerivedOperations.Exercises where

import Data.Monoid

-- Question 1
sum' :: (Foldable t, Num a) => t a -> a
sum' = getSum . foldMap Sum

-- Question 2
product' :: (Foldable t, Num a) => t a -> a
product' = getProduct . foldMap Product

-- Question 3
elem' :: (Foldable t, Eq a) => a -> t a -> Bool
elem' t = foldr (\x acc -> x == t || acc) False

-- Question 4
minimum' :: (Foldable t, Ord a) => t a -> Maybe a
minimum' = foldr comp Nothing
    where comp x Nothing = Just x
          comp x y       = fmap (min x) y

-- Question 5 
maximum' :: (Foldable t, Ord a) => t a -> Maybe a
maximum' = foldr comp Nothing
    where comp x Nothing = Just x
          comp x y       = fmap (max x) y

-- Question 6
null' :: (Foldable t) => t a -> Bool
null' = foldr (\x acc -> False) True

-- Question 7
length' :: (Foldable t) => t a -> Int
length' = foldr (\x acc -> acc + 1) 0

-- Question 8
toList' :: (Foldable t) => t a -> [a]
toList' = foldr (:) []

-- Question 9
fold' :: (Foldable t, Monoid m) => t m -> m
fold' = foldMap id

-- Question 10
foldMap' :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
foldMap' f = foldr (\x acc -> f x `mappend` acc) mempty
