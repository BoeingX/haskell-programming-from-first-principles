module Reader.Reader.ShortExerciseSpec where

import Test.Hspec
import Reader.Reader.ShortExercise

spec :: Spec
spec = do
    describe "Test composed and fmapped" $ do
        it "composed \"Julie\"" $ do
            composed "Julie" `shouldBe` "EILUJ"
        it "fmapped \"Chris\"" $ do
            fmapped "Chris" `shouldBe` "SIRHC"
    describe "Test tupled and tupled'" $ do
        it "tupled \"Julie\"" $ do
            tupled "Julie" `shouldBe` ("JULIE","eiluJ")
        it "tupled' \"Julie\"" $ do
            tupled' "Julie" `shouldBe` ("JULIE","eiluJ")
