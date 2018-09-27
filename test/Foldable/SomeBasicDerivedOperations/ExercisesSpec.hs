module Foldable.SomeBasicDerivedOperations.ExercisesSpec where

import Data.Monoid
import Test.Hspec
import Foldable.SomeBasicDerivedOperations.Exercises

spec :: Spec
spec = do
    describe "Test sum" $ do
        it "sum' [1, 2, 3]" $ do
            sum' [1, 2, 3] `shouldBe` 6
        it "sum' [] :: Integer" $ do
            (sum' [] :: Integer) `shouldBe` 0
    describe "Test product" $ do
        it "product' [1, 2, 3]" $ do
            product' [1, 2, 3] `shouldBe` 6
        it "product' [] :: Integer" $ do
            (product' [] :: Integer) `shouldBe` 1
    describe "Test elem" $ do
        it "elem 2 (Just 3)" $ do
            elem 2 (Just 3) `shouldBe` False
        it "elem True (Left False)" $ do 
            elem True (Left False) `shouldBe` False
        it "elem True (Left True)" $ do
            elem True (Left True) `shouldBe` False
        it "elem True (Right False)" $ do
            elem True (Right False) `shouldBe` False
        it "elem True (Right True)" $ do
            elem True (Right True) `shouldBe` True
        it "fmap (elem 3) [Right 1, Right 2, Right 3]" $ do
            fmap (elem 3) [Right 1, Right 2, Right 3] `shouldBe` [False,False,True]
    describe "Test minimum" $ do
        it "minimum \"julie\"" $ do
            minimum' "julie" `shouldBe` Just 'e'
        it "fmap minimum (Just \"julie\")" $ do
            fmap minimum' (Just "julie") `shouldBe` Just (Just 'e')
        it "fmap minimum [Just 'j', Just 'u', Just 'l']" $ do
            fmap minimum' [Just 'j', Just 'u', Just 'l'] `shouldBe` [Just 'j', Just 'u', Just 'l']
        it "fmap minimum [Just 4, Just 3, Nothing]" $ do
            fmap minimum' [Just 4, Just 3, Nothing] `shouldBe` [Just 4, Just 3, Nothing]
    describe "Test maximum'" $ do
        it "maximum' [] :: Maybe Integer" $ do
            (maximum' [] :: Maybe Integer) `shouldBe` Nothing
        it "maximum' [1, 2, 3]" $ do
            maximum' [1, 2, 3] `shouldBe` Just 3
    describe "Test null'" $ do
        it "null (Left 3)" $ do
            null' (Left 3) `shouldBe` True
        it "null []" $ do
            null' [] `shouldBe` True
        it "null Nothing" $ do
            null' Nothing `shouldBe` True
        it "null (1, 2)" $ do
            null' (1, 2) `shouldBe` False
        it "fmap null [Just 1, Just 2, Nothing]" $ do
            fmap null' [Just 1, Just 2, Nothing] `shouldBe` [False,False,True]
    describe "Test length" $ do
        it "length (1, 2)" $ do
            length' (1, 2) `shouldBe` 1
        it "length [(1, 2), (3, 4), (5, 6)]" $ do
            length' [(1, 2), (3, 4), (5, 6)] `shouldBe` 3
        it "fmap length [(1, 2), (3, 4), (5, 6)]" $ do
            fmap length' [(1, 2), (3, 4), (5, 6)] `shouldBe` [1,1,1]
        it " fmap length Just [1, 2, 3]" $ do
            fmap length' Just [1, 2, 3] `shouldBe` 1
        it "fmap length [Just 1, Just 2, Just 3]" $ do
            fmap length' [Just 1, Just 2, Just 3] `shouldBe` [1, 1, 1]
        it "fmap length [Just 1, Just 2, Nothing]" $ do
            fmap length' [Just 1, Just 2, Nothing] `shouldBe` [1, 1, 0]
    describe "Test toList" $ do
        it "toList (Just 1)" $ do
            toList' (Just 1) `shouldBe` [1]
        it "map toList [Just 1, Just 2, Just 3]" $ do
            map toList' [Just 1, Just 2, Just 3] `shouldBe` [[1],[2],[3]]
        it "concatMap toList [Just 1, Just 2, Just 3]" $ do
            concatMap toList' [Just 1, Just 2, Just 3] `shouldBe` [1, 2, 3]
        it "concatMap toList [Just 1, Just 2, Nothing]" $ do
            concatMap toList' [Just 1, Just 2, Nothing] `shouldBe` [1, 2]
        it "toList (1, 2)" $ do
            toList' (1, 2) `shouldBe` [2]
    describe "Test fold" $ do
        it "fold [Sum 1, Sum 2, Sum 3, Sum 4, Sum 5]" $ do
            fold' [Sum 1, Sum 2, Sum 3, Sum 4, Sum 5] `shouldBe` Sum 15
        it "fold [1, 2, 3, 4, 5 :: Product Integer]" $ do
            fold' [1, 2, 3, 4, 5 :: Product Integer] `shouldBe` Product 120
    describe "Test foldMap" $ do
        it "foldMap (*5) (Just 100) :: Product Integer" $ do
            (foldMap' (*5) (Just 100) :: Product Integer) `shouldBe` Product 500
        it "foldMap (*5) [1, 2, 3 :: Product Integer]" $ do
            foldMap' (*5) [1, 2, 3 :: Product Integer] `shouldBe` Product 750
        it "foldMap (*5) [1, 2, 3 :: Sum Integer]" $ do
            foldMap' (*5) [1, 2, 3 :: Sum Integer] `shouldBe` Sum 30
