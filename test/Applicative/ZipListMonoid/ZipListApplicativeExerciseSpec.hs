module Applicative.ZipListMonoid.ZipListApplicativeExerciseSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Classes
import Applicative.ZipListMonoid.ZipListApplicativeExercise

spec :: Spec
spec = do
    testBatch $ applicative (undefined :: ZipList' (Integer, Integer, Integer))
