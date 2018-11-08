module Recursion.ChapterExercises.FixingDividedBySpec where

import Test.Hspec
import Test.QuickCheck
import Recursion.ChapterExercises.FixingDividedBy

spec :: Spec
spec = do
    describe "Test div'" $ do
        it "should behave the same as div when y /= 0" $ property $
            \x y -> y /= 0 ==> div' x y == Result (x `div` y)
        it "should give bottom when y == 0" $ property $
            \x -> div' x 0 == DividedByZero
