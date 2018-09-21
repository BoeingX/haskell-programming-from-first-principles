module Testing.ChapterExercises.Idempotence where

import Data.Char

twice f = f . f
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord = map toUpper
