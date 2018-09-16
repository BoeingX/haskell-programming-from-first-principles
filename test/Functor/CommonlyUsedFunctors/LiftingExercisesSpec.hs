module Functor.CommonlyUsedFunctors.LiftingExercisesSpec where

import Test.Hspec
import Functor.CommonlyUsedFunctors.LiftingExercises

spec :: Spec
spec = do
    describe "Lifting exercises" $ do
        it "check a" $ do
            a `shouldBe` [2]
        it "check b" $ do
            b `shouldBe` Just ["Hi,lol","Hellolol"]
        it "check c" $ do
            c 1 `shouldBe` -2
        it "check d" $ do
            d 0 `shouldBe` "1[0,1,2,3]"
        it "check e" $ do
            x <- e
            x `shouldBe` 3693
