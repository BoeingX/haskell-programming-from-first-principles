module Functor.ChapterExercises.RearrangeArgumentsSpec where

import Test.Hspec
import Functor.ChapterExercises.RearrangeArguments

spec :: Spec
spec = do
    describe "Test the implementation of More" $ do
        it "fmap (+1) (L 1 2 3)" $ do
            fmap (+1) (L 1 2 3) `shouldBe` L 2 2 4
        it "fmap (+1) (R 1 2 3)" $ do
            fmap (+1) (R 1 2 3) `shouldBe` R 1 3 3
