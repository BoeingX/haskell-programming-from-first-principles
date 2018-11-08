module Lists.FilteringListsOfValues.IntermissionExercises where

-- Question 1
multiplesOfThree :: [Int] -> [Int]
multiplesOfThree = filter (\x -> x `rem` 3 == 0)

-- Question 2
howManyMultiplesOfThree :: [Int] -> Int
howManyMultiplesOfThree = length . multiplesOfThree

-- Question 3
removeArticles :: String -> [String]
removeArticles = filter (\x -> not (x `elem` ["the", "a", "an"])) . words
