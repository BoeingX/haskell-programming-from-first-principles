module AlgebraicDataTypes.ChapterExercises.AsPatternsSpec where

import Test.Hspec
import AlgebraicDataTypes.ChapterExercises.AsPatterns

spec :: Spec
spec = do
    describe "Test isSubsequenceOf" $ do
        it "isSubsequenceOf \"blah\" \"blahwoot\"" $ do
            isSubsequenceOf "blah" "blahwoot" `shouldBe` True
        it "isSubsequenceOf \"blah\" \"wootblah\"" $ do
            isSubsequenceOf "blah" "wootblah" `shouldBe` True
        it "isSubsequenceOf \"blah\" \"wboloath\"" $ do
            isSubsequenceOf "blah" "wboloath" `shouldBe` True
        it "isSubsequenceOf \"blah\" \"wootbla\"" $ do
            isSubsequenceOf "blah" "wootbla" `shouldBe` False
        it "isSubsequenceOf \"abc\" \"cba\"" $ do
            isSubsequenceOf "abc" "cba" `shouldBe` True
    describe "Test capitalizeWords" $ do
        it "capitalizeWords \"hello world\"" $ do
            capitalizeWords "hello world" `shouldBe` [("hello", "Hello"), ("world", "World")]
