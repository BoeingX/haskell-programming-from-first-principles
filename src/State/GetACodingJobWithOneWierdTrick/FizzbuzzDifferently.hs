module State.GetACodingJobWithOneWierdTrick.FizzbuzzDifferently where

import Control.Monad
import Control.Monad.Trans.State

fizzBuzz :: Integer -> String
fizzBuzz n 
  | n `mod` 15 == 0 = "FizzBuzz"
  | n `mod` 5 == 0  = "Fizz"
  | n `mod` 3 == 0  = "Buzz"
  | otherwise       = show n

fizzbuzzList :: [Integer] -> [String]
fizzbuzzList list = execState (mapM_ addResult list) []

addResult :: Integer -> State [String] ()
addResult n = do
    xs <- get
    let result = fizzBuzz n
    put (result : xs)

fizzbuzzFromTo :: Integer -> Integer -> [String]
fizzbuzzFromTo a b = fizzbuzzList [b, b-1 ..a]
