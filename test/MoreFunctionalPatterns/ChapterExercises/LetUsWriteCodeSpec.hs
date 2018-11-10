module MoreFunctionalPatterns.ChapterExercises.LetUsWriteCodeSpec where

import Test.Hspec
import MoreFunctionalPatterns.ChapterExercises.LetUsWriteCode

spec :: Spec
spec = do
    describe "Test roundTrip'" $ do
        it "roundTrip' 4" $ do
            roundTrip' 4 `shouldBe` 4
