module AlgebraicDataTypes.ConstructingAndDeconstructingValues.ExerciseSpec where

import Test.Hspec
import AlgebraicDataTypes.ConstructingAndDeconstructingValues.Exercise

spec :: Spec
spec = do
    describe "Test allProgrammers" $ do
        it "Test cardinality" $ do
            length allProgrammers `shouldBe` length allOperatingSystems * length allLanguages
    describe "Test allProgrammers'" $ do
        it "Test cardinality" $ do
            length allProgrammers' `shouldBe` length allOperatingSystems * length allLanguages
