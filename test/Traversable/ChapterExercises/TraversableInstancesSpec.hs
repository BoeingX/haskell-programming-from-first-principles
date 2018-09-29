module Traversable.ChapterExercises.TraversableInstancesSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Classes
import Traversable.ChapterExercises.TraversableInstances

spec :: Spec
spec = do
    testBatch $ traversable (undefined :: Identity (Int, Int, [Int]))
    testBatch $ traversable (undefined :: Constant Int (Int, Int, [Int]))
    testBatch $ traversable (undefined :: Optional (Int, Int, [Int]))
    testBatch $ traversable (undefined :: List (Int, Int, [Int]))
    testBatch $ traversable (undefined :: Three Int Int (Int, Int, [Int]))
    testBatch $ traversable (undefined :: Three' Int (Int, Int, [Int]))
    testBatch $ traversable (undefined :: S [] (Int, Int, [Int]))
