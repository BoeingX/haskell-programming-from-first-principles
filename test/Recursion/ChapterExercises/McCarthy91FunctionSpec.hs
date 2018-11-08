module Recursion.ChapterExercises.McCarthy91FunctionSpec where

import Test.Hspec
import Recursion.ChapterExercises.McCarthy91Function

spec :: Spec
spec = do
    describe "Test mc91" $ do
        it "map mc91 [95..110]" $ do
            map mc91 [95..110] `shouldBe` [91,91,91,91,91,91,91,92,93,94,95,96,97,98,99,100]
