module SignalingAdversity.ChapterExercises.ItIsOnlyNaturalSpec where

import Test.Hspec
import SignalingAdversity.ChapterExercises.ItIsOnlyNatural

spec :: Spec
spec = do
    describe "Test natToInteger" $ do
        it "natToInteger Zero" $ do
            natToInteger Zero `shouldBe` 0
        it "natToInteger (Succ Zero)" $ do
            natToInteger (Succ Zero) `shouldBe` 1
        it "natToInteger (Succ (Succ Zero))" $ do
            natToInteger (Succ (Succ Zero)) `shouldBe` 2
    describe "Test integerToNat" $ do
        it "integerToNat 0" $ do
            integerToNat 0 `shouldBe` Just Zero
        it "integerToNat 1" $ do
            integerToNat 1 `shouldBe` Just (Succ Zero)
        it "integerToNat 2" $ do
            integerToNat 2 `shouldBe` Just (Succ (Succ Zero))
        it "integerToNat (-1)" $ do
            integerToNat (-1) `shouldBe` Nothing
