module ParserCombinators.ChapterExercises.IPV4AddressesSpec where

import Control.Applicative
import Data.Word
import Text.Trifecta
import Test.Hspec
import Test.QuickCheck (property)
import ParserCombinators.ChapterExercises.IPV4Addresses

spec :: Spec
spec = do
    describe "Test decimalToBin" $ do
        it "decimalToBin 0" $ do
            decimalToBin 0 `shouldBe` [0]
        it "decimalToBin 1" $ do
            decimalToBin 1 `shouldBe` [1]
        it "decimalToBin 2" $ do
            decimalToBin 2 `shouldBe` [1, 0]
        it "decimalToBin 3" $ do
            decimalToBin 3 `shouldBe` [1, 1]
        it "decimalToBin 4" $ do
            decimalToBin 4 `shouldBe` [1, 0, 0]
        it "decimalToBin 5" $ do
            decimalToBin 5 `shouldBe` [1, 0, 1]
        it "decimalToBin 6" $ do
            decimalToBin 6 `shouldBe` [1, 1, 0]
        it "decimalToBin 7" $ do
            decimalToBin 7 `shouldBe` [1, 1, 1]
    describe "Test dotDecimalToBin" $ do
        it "dotDecimalToBin [127, 0, 0, 1]" $ do
            dotDecimalToBin [127, 0, 0, 1] `shouldBe` map (\x -> read [x]) "01111111000000000000000000000001"
    describe "Test binToDecimal" $ do
        it "is inverse to decimalToBin" $ property $
            \x -> (binToDecimal . decimalToBin) x == (x :: Integer)
    describe "Test ipAddress" $ do
        it "172.16.254.1" $ do
            parseString ipAddress mempty "172.16.254.1" `shouldBe` Success (IPAddress 2886794753)
        it "204.120.0.15" $ do
            parseString ipAddress mempty "204.120.0.15" `shouldBe` Success (IPAddress 3430416399)
    describe "Test Show instance" $ do
        it "is inverse to ipAddress" $ property $
            \x -> (parseString ipAddress mempty . show) x == Success x
