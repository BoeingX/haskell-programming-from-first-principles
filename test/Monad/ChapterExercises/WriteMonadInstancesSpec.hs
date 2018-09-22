module Monad.ChapterExercises.WriteMonadInstancesSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Monad.ChapterExercises.WriteMonadInstances

spec :: Spec
spec = do
    describe "Test Nope a" $ do
        testBatch $ functor (undefined :: Nope (Integer, Integer, Integer))
        testBatch $ applicative (undefined :: Nope (Integer, Integer, Integer))
        testBatch $ monad (undefined :: Nope (Integer, Integer, Integer))
    describe "Test PhhhbbtttEither b a" $ do
        testBatch $ functor (undefined :: PhhhbbtttEither Integer (Integer, Integer, Integer))
        testBatch $ applicative (undefined :: PhhhbbtttEither Integer (Integer, Integer, Integer))
        testBatch $ monad (undefined :: PhhhbbtttEither Integer (Integer, Integer, Integer))
    describe "Test Identity a" $ do
        testBatch $ functor (undefined :: Identity (Integer, Integer, Integer))
        testBatch $ applicative (undefined :: Identity (Integer, Integer, Integer))
        testBatch $ monad (undefined :: Identity (Integer, Integer, Integer))
    describe "Test List a" $ do
        testBatch $ functor (undefined :: List (Integer, Integer, Integer))
        testBatch $ applicative (undefined :: List (Integer, Integer, Integer))
        testBatch $ monad (undefined :: List (Integer, Integer, Integer))
