module FoldingLists.Scans.ScansExercises where

import Data.List

-- Question 1
fibs :: [Integer]
fibs = scanl (+) 1 fibs

fibs' :: [Integer]
fibs' = take 20 fibs

-- Question 2
fibs'' :: [Integer]
fibs'' = takeWhile (<100) fibs

-- Question 3
factorial :: [Integer]
factorial = scanl (*) 1 [2..]
