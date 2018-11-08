module Lists.ChapterExercises.CharSpec where

import Test.Hspec
import Lists.ChapterExercises.Char

spec :: Spec
spec = do
    describe "Test keepOnlyUppercase" $ do
        it "keepOnlyUppercase \"HbEfLrLxO\"" $ do
            keepOnlyUppercase "HbEfLrLxO" `shouldBe` "HELLO"
    describe "Test captializeFirstLetter" $ do
        it "captializeFirstLetter \"julie\"" $ do
            captializeFirstLetter "julie" `shouldBe` "Julie"
    describe "Test captialize" $ do
        it "captialize \"woot\"" $ do
            captialize "woot" `shouldBe` "WOOT"
