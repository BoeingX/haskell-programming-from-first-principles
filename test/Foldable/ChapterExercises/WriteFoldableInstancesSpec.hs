module Foldable.ChapterExercises.WriteFoldableInstancesSpec where

import Data.Monoid
import Test.Hspec
import Foldable.ChapterExercises.WriteFoldableInstances

spec :: Spec
spec = do
    describe "Test Constant a b" $ do
        it "foldMap (++\"hi\") (Constant 5 :: Constant Integer String)" $ do
            foldMap (++"hi") (Constant 5 :: Constant Integer String) `shouldBe` ""
        it "foldMap (*5) (Constant 5 :: Constant Integer (Sum Integer))" $ do
            foldMap (*5) (Constant 5 :: Constant Integer (Sum Integer)) `shouldBe` Sum 0
    describe "Test Two a b" $ do
        it "foldr (*) 10 (Two 1 2)" $ do
            foldr (*) 10 (Two 1 2) `shouldBe` 20
        -- foldMap still needs an Monoid constraints for type check
        it "foldMap (*5) (Two 1 2 :: Two (Sum Integer) (Sum Integer))" $ do
            foldMap (*5) (Two 1 2 :: Two (Sum Integer) (Sum Integer)) `shouldBe` Sum 10
    describe "Test Three a b c" $ do
        it "foldr (*) 10 (Three 1 2 3)" $ do
            foldr (*) 10 (Three 1 2 3) `shouldBe` 30
    describe "Test Three' a b" $ do
        it "foldr (*) 10 (Three' 1 2 3)" $ do
            foldr (*) 10 (Three' 1 2 3) `shouldBe` 60
        it "foldMap (*10) (Three' 1 2 3 :: Three' Integer (Sum Integer))" $ do
            foldMap (*10) (Three' 1 2 3 :: Three' Integer (Sum Integer)) `shouldBe` Sum 50
    describe "Test Four' a b" $ do
        it "foldMap (*10) (Four' 1 2 3 4 :: Four' Integer (Product Integer))" $ do
            foldMap (*10) (Four' 1 2 3 4 :: Four' Integer (Product Integer)) `shouldBe` Product (20 * 30 * 40)
