module Lists.ExtractingPortionsOfLists.IntermissionExercises where

-- Question 1
splitBy :: Char -> String -> [String]
splitBy _ "" = []
splitBy x xs = let xs' = dropWhile (== x) xs
                   w   = takeWhile (/= x) xs'
                   ws  = dropWhile (/= x) xs'
               in if null w
                     then splitBy x ws
                     else w : splitBy x ws

myWords :: String -> [String]
myWords = splitBy ' '


myLines :: String -> [String]
myLines = splitBy '\n'
