module ParserCombinators.ChapterExercises.ParseDigitAndIntegerSpec where

import Text.Trifecta
import Test.Hspec
import ParserCombinators.ChapterExercises.ParseDigitAndInteger

spec :: Spec
spec = do
    describe "Test parseDigit" $ do
        it "parseString parseDigit mempty \"123\"" $ do
            parseString parseDigit mempty "123" `shouldBe` Success '1'
        it "parseString parseDigit mempty \"abc\"" $ do
            parseString parseDigit mempty "abc" `shouldBe` Failure undefined
    describe "Test base10Integer" $ do
        it "parseString base10Integer mempty \"123abc\"" $ do
            parseString base10Integer mempty "123abc" `shouldBe` Success 123
        it "parseString base10Integer mempty \"abc\"" $ do
            parseString base10Integer mempty "abc" `shouldBe` Failure undefined
        it "parseString base10Integer mempty \"-123\"" $ do
            parseString base10Integer mempty "-123" `shouldBe` Failure undefined
    describe "Test base10Integer'" $ do
        it "parseString base10Integer' mempty \"123\"" $ do
            parseString base10Integer' mempty "123" `shouldBe` Success 123
        it "parseString base10Integer' mempty \"+123abc\"" $ do
            parseString base10Integer' mempty "+123abc" `shouldBe` Success 123
        it "parseString base10Integer' mempty \"-123abc\"" $ do
            parseString base10Integer' mempty "-123abc" `shouldBe` Success (-123)
        it "parseString base10Integer' mempty \"abc\"" $ do
            parseString base10Integer' mempty "abc" `shouldBe` Failure undefined
