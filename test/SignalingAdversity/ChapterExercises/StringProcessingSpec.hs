module SignalingAdversity.ChapterExercises.StringProcessingSpec where

import Test.Hspec
import SignalingAdversity.ChapterExercises.StringProcessing

spec :: Spec
spec = do
    describe "Test notThe" $ do
        it "notThe \"the\"" $ do
            notThe "the" `shouldBe` Nothing
        it "notThe \"blahtheblah\"" $ do
            notThe "blahtheblah" `shouldBe` Just "blahtheblah"
        it "notThe \"woot\"" $ do
            notThe "woot" `shouldBe` Just "woot"
    describe "Test replaceThe" $ do
        it "replaceThe \"the cow loves us\"" $ do
            replaceThe "the cow loves us" `shouldBe` "a cow loves us"
    describe "Test countTheBeforeVowel" $ do
        it "countTheBeforeVowel \"the cow\"" $ do
            countTheBeforeVowel "the cow" `shouldBe` 0
        it "countTheBeforeVowel \"the evil cow\"" $ do
            countTheBeforeVowel "the evil cow" `shouldBe` 1
    describe "Test countVowels" $ do
        it "countVowels \"the cow\"" $ do
            countVowels "the cow" `shouldBe` 2
        it "countVowels \"Mikolajczak\"" $ do
            countVowels "Mikolajczak" `shouldBe` 4
