module Recursion.ChapterExercises.NumbersIntoWordsSpec where

import Test.Hspec
import Recursion.ChapterExercises.NumbersIntoWords

spec :: Spec
spec = do
    describe "Test wordNumber" $ do
        it "wordNumber 12324546" $ do
            wordNumber 12324546 `shouldBe` "one-two-three-two-four-five-four-six"
