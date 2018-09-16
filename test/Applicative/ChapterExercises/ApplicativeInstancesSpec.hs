module Applicative.ChapterExercises.ApplicativeInstancesSpec where

import Test.Hspec
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Applicative.ChapterExercises.ApplicativeInstances

spec :: Spec
spec = do
    describe "Test Applicative implementations of Identity, Pair, Two, etc" $ do
        it "Test Identity a" $ do
            quickBatch $ applicative (undefined :: Identity (Integer, Integer, Integer))
        it "Test Pair a" $ do
            quickBatch $ applicative (undefined :: Pair (Integer, Integer, Integer))
        it "Test Two a b" $ do
            quickBatch $ applicative (undefined :: Two String (Integer, Integer, Integer))
        it "Test Three a b c" $ do
            quickBatch $ applicative (undefined :: Three String String (Integer, Integer, Integer))
        it "Test Three' a b" $ do
            quickBatch $ applicative (undefined :: Three' String (Integer, Integer, Integer))
        it "Test Four a b c d" $ do
            quickBatch $ applicative (undefined :: Four String String String (Integer, Integer, Integer))
        it "Test Four' a b" $ do
            quickBatch $ applicative (undefined :: Four' String (Integer, Integer, Integer))
