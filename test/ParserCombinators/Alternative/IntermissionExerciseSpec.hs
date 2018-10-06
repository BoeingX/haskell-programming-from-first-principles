module ParserCombinators.Alternative.IntermissionExerciseSpec where

import Data.Ratio ((%))
import Test.Hspec
import Text.Trifecta
import ParserCombinators.Alternative.IntermissionExercise

spec :: Spec
spec = do
    describe "Test parseIor" $ do
        it "parseString parseIor mempty \"1\"" $ do
            parseString parseIor mempty "1" `shouldBe` Success (Right 1)
        it "parseString parseIor mempty \"12\"" $ do
            parseString parseIor mempty "12" `shouldBe` Success (Right 12)
        it "parseString parseIor mempty \"1/2\"" $ do
            parseString parseIor mempty "1/2" `shouldBe` Success (Left (1 % 2))
        it "parseString parseIor mempty \"1/0\"" $ do
            parseString parseIor mempty "1/0" `shouldBe` Success (Right 1)
