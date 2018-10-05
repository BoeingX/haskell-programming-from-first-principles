module State.ThrowDown.Exercises where

import System.Random

data Die =
    DieOne
  | DieTwo
  | DieThree
  | DieFour
  | DieFive
  | DieSix
  deriving (Eq, Show)

intToDie :: Int -> Die
intToDie n =
    case n of
        1 -> DieOne
        2 -> DieTwo
        3 -> DieThree
        4 -> DieFour
        5 -> DieFive
        6 -> DieSix
        -- Use this tactic _extremely_ sparingly.
        x -> error $ "intToDie got non 1-6 integer: " ++ show x

-- Exercise 1
rollsToGetN :: Int -> StdGen -> Int
rollsToGetN limit = go 0 0
    where go :: Int -> Int -> StdGen -> Int
          go sum count gen
            | sum >= limit = count
            | otherwise = go (sum + die) (count + 1) nextGen
                where (die, nextGen) = randomR (1, 6) gen

-- Exercise 2
rollsCountLogged :: Int -> StdGen -> (Int, [Die])
rollsCountLogged limit = go 0 0 []
    where go :: Int -> Int -> [Die] -> StdGen -> (Int, [Die])
          go sum count dies gen
            | sum >= limit = (count, dies)
            | otherwise = go (sum + die) (count + 1) (intToDie die : dies) nextGen
                where (die, nextGen) = randomR (1, 6) gen
