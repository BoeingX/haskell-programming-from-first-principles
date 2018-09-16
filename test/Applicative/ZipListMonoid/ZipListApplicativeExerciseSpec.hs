module Applicative.ZipListMonoid.ZipListApplicativeExerciseSpec where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Applicative.ZipListMonoid.ZipListApplicativeExercise

spec :: Spec
spec = do
    describe "Test ZipList Applicative implementation" $ do
        it "Test with checkers" $ do
            quickBatch $ applicative (undefined :: ZipList' (Integer, Integer, Integer))
