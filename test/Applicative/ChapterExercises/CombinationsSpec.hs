module Applicative.ChapterExercises.CombinationsSpec where

import Test.Hspec
import Applicative.ChapterExercises.Combinations

spec :: Spec
spec = do
    describe "Test Combinations" $ do
        it "Cardinal should be ok" $ do
            length (combos stops vowels stops) `shouldBe` length stops * length vowels * length stops
