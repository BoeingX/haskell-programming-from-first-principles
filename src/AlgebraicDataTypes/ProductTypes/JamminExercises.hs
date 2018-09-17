module AlgebraicDataTypes.ProductTypes.JamminExercises where

import Data.List
import Data.Ord

data Fruit = 
    Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Show, Ord)

data JamJars = 
    Jam { fruit :: Fruit
        , jars :: Int }
        deriving (Eq, Show, Ord)

-- Question 3
-- The cardinality of JamJars is 4 * (2 ^ 64)

-- Question 6
totalNumberOfJars :: [JamJars] -> Int
totalNumberOfJars = sum . map jars

-- Question 7
mostRow :: [JamJars] -> JamJars
mostRow = maximumBy (comparing jars)

-- Question 9
sortJars :: [JamJars] -> [JamJars]
sortJars = sortOn fruit

-- Question 10
groupJam :: [JamJars] -> [[JamJars]]
groupJam = groupBy (\x y -> fruit x == fruit y) . sortJars
