module ParserCombinators.ParsingFractions.IntermissionExerciseSpec where

import Test.Hspec
import Text.Trifecta
import ParserCombinators.ParsingFractions.IntermissionExercise

spec :: Spec
spec = do
    describe "Test parseInteger" $ do
        it "parseString parseInteger mempty \"123\"" $ do
            parseString parseInteger mempty "123" `shouldBe` Success 123
        it "parseString parseInteger mempty \"123abc\"" $ do
            parseString parseInteger mempty "123abc" `shouldBe` Failure undefined
