module Applicative.ApplicativeInUse.ConstantExerciseSpec where

import Data.Monoid (Sum (..))
import Test.Hspec
import Applicative.ApplicativeInUse.ConstantExercise

spec :: Spec
spec = do
    describe "Test Constant implementation" $ do
        it "Constant (Sum 1) <*> Constant (Sum 2) should equal Constant (Sum 3)" $ do
            Constant (Sum 1) <*> Constant (Sum 2) `shouldBe` Constant (Sum 3)
        it "pure 1 :: Constant String Int should be Constant \"\"" $ do
            (pure 1 :: Constant String Int) `shouldBe` Constant ""
