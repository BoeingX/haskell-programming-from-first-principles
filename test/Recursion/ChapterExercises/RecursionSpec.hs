module Recursion.ChapterExercises.RecursionSpec where

import Test.Hspec
import Test.QuickCheck
import Recursion.ChapterExercises.Recursion

spec :: Spec
spec = do
    describe "Test sumToN" $ do
        it "should behave the same as sum [1..n]" $ property $
            -- See https://stackoverflow.com/a/12884999 fot
            -- the use of `==>`
            \n -> n >= 1 ==> sumToN n == sum [1..(n :: Int)]
    describe "Test multiply" $ do
        it "should be the same as x * y" $ property $
            \x y -> multiply x y == x * (y :: Int)
