module Lists.UsingRangesToConstructLists.ExerciseSpec where

import Test.Hspec
import Test.QuickCheck
import Lists.UsingRangesToConstructLists.Exercise

spec :: Spec
spec = do
    describe "Test eftBool" $ do
        it "is equivalent to enumFromTo" $ property $
            \x y -> eftBool x y == [x..y]
    describe "Test eftOrd" $ do
        it "is equivalent to enumFromTo" $ property $
            \x y -> eftOrd x y == [x..y]
    describe "Test eftInt" $ do
        it "is equivalent to enumFromTo" $ property $
            \x y -> eftInt x y == [x..y]
    describe "Test eftChar" $ do
        it "is equivalent to enumFromTo" $ property $
            \x y -> eftChar x y == [x..y]
