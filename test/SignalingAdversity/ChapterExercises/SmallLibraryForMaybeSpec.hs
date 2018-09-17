module SignalingAdversity.ChapterExercises.SmallLibraryForMaybeSpec where

import Test.Hspec
import SignalingAdversity.ChapterExercises.SmallLibraryForMaybe

spec :: Spec
spec = do
    describe "Test isJust" $ do
        it "isJust (Just 1)" $ do
            isJust (Just 1) `shouldBe` True
        it "isJust Nothing" $ do
            isJust Nothing `shouldBe` False
    describe "Test isNothing" $ do
        it "isNothing (Just 1)" $ do
            isNothing (Just 1) `shouldBe` False
        it "isNothing Nothing" $ do
            isNothing Nothing `shouldBe` True
    describe "Test maybee" $ do
        it "mayybee 0 (+1) Nothing" $ do
            mayybee 0 (+1) Nothing `shouldBe` 0
        it "mayybee 0 (+1) (Just 1)" $ do
            mayybee 0 (+1) (Just 1) `shouldBe` 2
    describe "Test fromMaybe" $ do
        it "fromMaybe 0 Nothing" $ do
            fromMaybe 0 Nothing `shouldBe` 0
        it "fromMaybe 0 (Just 1)" $ do
            fromMaybe 0 (Just 1) `shouldBe` 1
    describe "Test listToMaybe" $ do
        it "listToMaybe [1, 2, 3]" $ do
            listToMaybe [1, 2, 3] `shouldBe` Just 1
        it "listToMaybe []" $ do
            listToMaybe ([] :: [Int]) `shouldBe` (Nothing :: Maybe Int)
    describe "Test maybeToList" $ do
        it "maybeToList (Just 1)" $ do
            maybeToList (Just 1) `shouldBe` [1]
        it "maybeToList Nothing" $ do
            maybeToList (Nothing :: Maybe Int) `shouldBe` ([] :: [Int])
    describe "Test catMaybes" $ do
        it "catMaybes [Just 1, Nothing, Just 2]" $ do
            catMaybes [Just 1, Nothing, Just 2] `shouldBe` [1, 2]
        it "catMaybes [Nothing, Nothing, Nothing]" $ do
            catMaybes ([Nothing, Nothing, Nothing] :: [Maybe Int]) `shouldBe` ([] :: [Int])
    describe "Test flipMaybe" $ do
        it "flipMaybe [Just 1, Just 2, Just 3]" $ do
            flipMaybe [Just 1, Just 2, Just 3] `shouldBe` Just [1, 2, 3]
        it "flipMaybe [Just 1, Nothing, Just 3]" $ do
            flipMaybe [Just 1, Nothing, Just 3] `shouldBe` (Nothing :: Maybe [Int])
