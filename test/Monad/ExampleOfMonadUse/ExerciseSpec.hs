module Monad.ExampleOfMonadUse.ExerciseSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Classes
import Monad.ExampleOfMonadUse.Exercise

spec :: Spec
spec = do
    testBatch $ functor (undefined :: Sum Integer (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Sum Integer (Integer, Integer, Integer))
    testBatch $ monad (undefined :: Sum Integer (Integer, Integer, Integer))
