module Reader.ButUhReader.ExerciseSpec where

import Test.Hspec
import Reader.ButUhReader.Exercise

spec :: Spec
spec = do
    describe "Test the ask implementation" $ do
        it "runReader ask 1" $ do
            runReader ask 1 `shouldBe` 1
        it "runReader ask \"haha\"" $ do
            runReader ask "haha" `shouldBe` "haha"
