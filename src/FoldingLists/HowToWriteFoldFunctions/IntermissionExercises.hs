module FoldingLists.HowToWriteFoldFunctions.IntermissionExercises where

import Data.List
import Data.Ord
import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

-- Question 1
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr go []
    where go (DbDate t) acc = t : acc
          go _ acc = acc

-- Question 2
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr go []
    where go (DbNumber x) acc = x : acc
          go _ acc = acc

-- Question 3
-- Descending sort https://ro-che.info/articles/2016-04-02-descending-sort-haskell
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = head . sortOn Down . filterDbDate

-- Question 4
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- Question 5
avgDb :: [DatabaseItem] -> Double
avgDb = avg . filterDbNumber
    where avg :: [Integer] -> Double
          avg xs = s / l
              where s = fromIntegral $ sum xs
                    l = fromIntegral $ length xs
