module Applicative.ChapterExercises.ApplicativeInstancesSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Classes
import Applicative.ChapterExercises.ApplicativeInstances

spec :: Spec
spec = do
    testBatch $ applicative (undefined :: Identity (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Pair (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Two String (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Three String String (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Three' String (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Four String String String (Integer, Integer, Integer))
    testBatch $ applicative (undefined :: Four' String (Integer, Integer, Integer))
