module Applicative.ZipListMonoid.ValidationExerciseSpec where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Applicative.ZipListMonoid.ValidationExercise

spec :: Spec
spec = do
    describe "Test Sum and Validation Applicative implementation" $ do
        it "Test with checkers" $ do
            quickBatch $ applicative (undefined :: Sum String (Integer, Integer, Integer))
