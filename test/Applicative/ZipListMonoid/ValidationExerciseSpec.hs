module Applicative.ZipListMonoid.ValidationExerciseSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Applicative.ZipListMonoid.ValidationExercise

spec :: Spec
spec = do
    testBatch $ applicative (undefined :: Sum String (Integer, Integer, Integer))
