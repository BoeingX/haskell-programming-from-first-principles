module AlgebraicDataTypes.ChapterExercises.AsPatterns where

import Data.Char
import Data.List (elemIndex)

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf xs@(x:xs') (y:ys')
    | x == y = isSubsequenceOf xs' ys'
    | otherwise = isSubsequenceOf xs ys'

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map f . words
    where f xs'@(x:xs) = (xs', toUpper x : xs)
