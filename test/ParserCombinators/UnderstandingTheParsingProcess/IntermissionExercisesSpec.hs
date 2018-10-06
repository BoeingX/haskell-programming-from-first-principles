module ParserCombinators.UnderstandingTheParsingProcess.IntermissionExercisesSpec where

import Test.Hspec
import Text.Trifecta
import ParserCombinators.UnderstandingTheParsingProcess.IntermissionExercises

spec :: Spec
spec = do
    describe "Test one" $ do
        it "parseString one mempty \"1\"" $ do
            parseString one mempty "1" `shouldBe` Success ()
        it "parseString one mempty \"12\"" $ do
            parseString one mempty "12" `shouldBe` Failure undefined
    describe "Test oneTwo" $ do
        it "parseString oneTwo mempty \"1\"" $ do
            parseString oneTwo mempty "1" `shouldBe` Failure undefined
        it "parseString oneTwo mempty \"12\"" $ do
            parseString oneTwo mempty "12" `shouldBe` Success ()
        it "parseString oneTwo mempty \"123\"" $ do
            parseString oneTwo mempty "123" `shouldBe` Failure undefined
    describe "Test oneTwoThree" $ do
        it "parseString oneTwoThree mempty \"1\"" $ do
            parseString oneTwoThree mempty "1" `shouldBe` Success "1"
        it "parseString oneTwoThree mempty \"12\"" $ do
            parseString oneTwoThree mempty "12" `shouldBe` Success "12"
        it "parseString oneTwoThree mempty \"123\"" $ do
            parseString oneTwoThree mempty "123" `shouldBe` Success "123"
    describe "Test string'" $ do
        let oneTwo'' = string' "12"
        it "Test oneTwo'' mempty \"1\"" $ do
            parseString oneTwo'' mempty "1" `shouldBe` Failure undefined
        it "Test oneTwo'' mempty \"12\"" $ do
            parseString oneTwo'' mempty "12" `shouldBe` Success "12"
        it "Test oneTwo'' mempty \"123\"" $ do
            parseString oneTwo'' mempty "123" `shouldBe` Success "12"
