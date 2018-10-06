module ParserCombinators.ChapterExercises.IPV6AddressesSpec where

import Control.Applicative
import Data.Word
import Text.Trifecta
import Test.Hspec
import Test.QuickCheck (property)
import ParserCombinators.ChapterExercises.IPV6Addresses

spec :: Spec
spec = do
    describe "Test uncollapse" $ do
        it "uncollapse [\"FE80\",\"\",\"0202\",\"B3FF\",\"FE1E\",\"8329\"]" $ do
            uncollapse ["FE80","","0202","B3FF","FE1E","8329"] `shouldBe` ["FE80","0", "0", "0", "0202","B3FF","FE1E","8329"]
        it "uncollapse [\"FE80\",\"0\",\"0\",\"0\",\"0202\",\"B3FF\",\"FE1E\",\"8329\"]" $ do
            uncollapse ["FE80","0", "0", "0", "0202","B3FF","FE1E","8329"] `shouldBe` ["FE80","0", "0", "0", "0202","B3FF","FE1E","8329"]
    describe "Test ipAddress6" $ do
        it "parseString ipAddress6 mempty \"0:0:0:0:0:ffff:ac10:fe01\"" $ do
            parseString ipAddress6 mempty "0:0:0:0:0:ffff:ac10:fe01" `shouldBe` Success (IPAddress6 0 281473568538113)
        it "parseString ipAddress6 mempty \"0:0:0:0:0:ffff:cc78:f\"" $ do
            parseString ipAddress6 mempty "0:0:0:0:0:ffff:cc78:f" `shouldBe` Success (IPAddress6 0 281474112159759)
        it "parseString ipAddress6 mempty \"FE80::0202:B3FF:FE1E:8329\"" $ do
            parseString ipAddress6 mempty "FE80::0202:B3FF:FE1E:8329" `shouldBe` Success (IPAddress6 18338657682652659712 144876050090722089)
        it "parseString ipAddress6 mempty \"2001:DB8::8:800:200C:417A\"" $ do
            parseString ipAddress6 mempty "2001:DB8::8:800:200C:417A" `shouldBe` Success (IPAddress6 2306139568115548160 2260596444381562)
    describe "Test decimalToHex" $ do
        it "decimalToHex 2260596444381562" $ do
            decimalToHex 2260596444381562 `shouldBe` "80800200C417A"
    describe "Test Show instance" $ do
        it "is inverse to ipAddress6" $ property $
            \x -> (parseString ipAddress6 mempty . show) x == Success x
