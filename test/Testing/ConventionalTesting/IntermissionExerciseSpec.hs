module Testing.ConventionalTesting.IntermissionExerciseSpec where

import Test.Hspec
import Testing.ConventionalTesting.IntermissionExercise

spec :: Spec
spec = do
    describe "Test dividedBy and multiply" $ do
        it "15 divided by 3 is 5" $ do
            dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is 4 remainder 2" $ do
            dividedBy 22 5 `shouldBe` (4, 2)
        it "1 times 2 should be 2" $ do
            multiply 1 2 `shouldBe` 2
        it "-1 times -2 should be 2" $ do
            multiply (-1) (-2) `shouldBe` 2
        it "1 times -2 should be -2" $ do
            multiply 1 (-2) `shouldBe` -2
