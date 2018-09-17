module AlgebraicDataTypes.ChapterExercises.CiphersSpec where

import Test.Hspec
import AlgebraicDataTypes.ChapterExercises.Ciphers

spec :: Spec
spec = do
    describe "Test calculateCompanion" $ do
        it "message=MEET AT DAWN and keyword=ALLY" $ do
            calculateCompanion "MEET AT DAWN" "ALLY" `shouldBe` "ALLY AL LYAL"
    describe "Test vigenereCipher" $ do
        it "message=MEET AT DAWN and keyword=ALLY" $ do
            vigenereCipher "MEET AT DAWN" "ALLY" `shouldBe` "MPPR AE OYWY"
