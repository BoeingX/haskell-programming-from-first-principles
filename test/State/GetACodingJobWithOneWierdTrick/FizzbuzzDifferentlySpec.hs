module State.GetACodingJobWithOneWierdTrick.FizzbuzzDifferentlySpec where

import Test.Hspec
import State.GetACodingJobWithOneWierdTrick.FizzbuzzDifferently

spec :: Spec
spec = do
    describe "Test fizzbuzzFromTo" $ do
        it "fizzbuzzFromTo 1 15" $ do
            fizzbuzzFromTo 1 15 `shouldBe` ["1", "2", "Buzz", "4", "Fizz", "Buzz", "7", "8", "Buzz", "Fizz", "11", "Buzz", "13", "14", "FizzBuzz"]
