module FoldingLists.ChapterExercises.WarmUpAndReview where

-- Question 1
stops = "pbtdkg"
vowels = "aeiou"

stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = [(x, y, z) | x <- stops, y <- vowels, z <- stops]

stopVowelStop' :: [(Char, Char, Char)]
stopVowelStop' = filter go stopVowelStop
    where go ('p', _, _) = True
          go _ = False

-- Question 2
-- This function calculates the average word length in a sentence
seekritFunc x = 
    div (sum (map length (words x)))
        (length (words x))

-- Question 3
seekritFunc' x = y / z
    where y = fromIntegral $ sum $ map length $ words x
          z = fromIntegral $ length $ words x
