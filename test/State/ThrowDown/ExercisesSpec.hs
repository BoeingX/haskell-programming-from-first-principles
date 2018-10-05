module State.ThrowDown.ExercisesSpec where

import System.Random
import Test.Hspec
import State.ThrowDown.Exercises

spec :: Spec
spec = do
    describe "Test rollsToGetN" $ do
        it "roolsToGetN 20" $ do
            rollsToGetN 20 (mkStdGen 0) `shouldBe` 5
    describe "Test rollsCountLogged" $ do
        it "rollsCountLogged 20" $ do
            rollsCountLogged 20 (mkStdGen 0) `shouldBe` (5, [DieFive, DieOne, DieFour, DieSix, DieSix])
