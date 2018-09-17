module AlgebraicDataTypes.ChapterExercises.AsPatterns where
    
import Data.Char

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf (x:xs) ys
  | null ys'' = False
  | otherwise = isSubsequenceOf xs (ys' ++ tail ys'')
    where (ys', ys'') = span (/= x) ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map f . words
    where f xs'@(x:xs) = (xs', toUpper x : xs)
