module Lists.ChapterExercises.Char where

import Data.Char

-- Question 2
keepOnlyUppercase :: String -> String
keepOnlyUppercase = filter isUpper

-- Question 3
captializeFirstLetter :: String -> String
captializeFirstLetter (x:xs) = toUpper x : xs

-- Question 4
captialize :: String -> String
captialize "" = ""
captialize (x:xs) = toUpper x : captialize xs

-- Question 5
captializeFirstLetter' :: String -> Char
captializeFirstLetter' = head . captializeFirstLetter
