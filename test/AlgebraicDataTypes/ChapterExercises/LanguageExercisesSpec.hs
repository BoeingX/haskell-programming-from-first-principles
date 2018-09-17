module AlgebraicDataTypes.ChapterExercises.LanguageExercisesSpec where

import Test.Hspec
import AlgebraicDataTypes.ChapterExercises.LanguageExercises

spec :: Spec
spec = do
    describe "Test capitalizeWord" $ do
        it "Empty string" $ do
            capitalizeWord "" `shouldBe` ""
        it "Single char" $ do
            capitalizeWord "h" `shouldBe` "H"
        it "Single word" $ do
            capitalizeWord "hello" `shouldBe` "Hello"
        it "Multiple words" $ do
            capitalizeWord "hello world" `shouldBe` "Hello world"
    describe "Test capitalizeParagraph" $ do
        it "Empty string" $ do
            capitalizeParagraph "" `shouldBe` ""
        it "Single char" $ do
            capitalizeParagraph "h" `shouldBe` "H"
        it "Single word" $ do
            capitalizeParagraph "hello" `shouldBe` "Hello"
        it "Multiple words" $ do
            capitalizeParagraph "hello world" `shouldBe` "Hello world"
        it "Multiple phrases" $ do
            capitalizeParagraph "blah.  woot    ha." `shouldBe` "Blah.  Woot    ha."
        it "Comma" $ do
            capitalizeParagraph "blah,  woot    ha." `shouldBe` "Blah,  woot    ha."
