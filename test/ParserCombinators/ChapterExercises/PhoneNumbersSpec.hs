module ParserCombinators.ChapterExercises.PhoneNumbersSpec where

import Text.Trifecta
import Test.Hspec
import ParserCombinators.ChapterExercises.PhoneNumbers

spec :: Spec
spec = do
    describe "Test parseNumberingPlanArea" $ do
        it "parseString parseNumberingPlanArea mempty \"123\"" $ do
            parseString parseNumberingPlanArea mempty "123" `shouldBe` Success 123
        it "parseString parseNumberingPlanArea mempty \"1-123-\"" $ do
            parseString parseNumberingPlanArea mempty "123" `shouldBe` Success 123
        it "parseString parseNumberingPlanArea mempty \"123-\"" $ do
            parseString parseNumberingPlanArea mempty "123-" `shouldBe` Success 123
        it "parseString parseNumberingPlanArea mempty \"(123) \"" $ do
            parseString parseNumberingPlanArea mempty "(123) " `shouldBe` Success 123
    describe "Test parsePhone" $ do
        it "parseString parsePhone mempty \"123-456-7890\"" $ do
            parseString parsePhone mempty "123-456-7890" `shouldBe` Success (PhoneNumber 123 456 7890)
        it "parseString parsePhone mempty \"1234567890\"" $ do
            parseString parsePhone mempty "1234567890" `shouldBe` Success (PhoneNumber 123 456 7890)
        it "parseString parsePhone mempty \"(123) 456-7890\"" $ do
            parseString parsePhone mempty "(123) 456-7890" `shouldBe` Success (PhoneNumber 123 456 7890)
        it "parseString parsePhone mempty \"1-123-456-7890\"" $ do
            parseString parsePhone mempty "123-456-7890" `shouldBe` Success (PhoneNumber 123 456 7890)
