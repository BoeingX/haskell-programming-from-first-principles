module FoldingLists.Scans.ScansExercisesSpec where

import Test.Hspec
import FoldingLists.Scans.ScansExercises

spec :: Spec
spec = do
    describe "Test factorial" $ do
        it "take 5 factorial" $ do
            take 5 factorial `shouldBe` [1, 2, 6, 24, 120]
