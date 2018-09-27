module Foldable.ChapterExercises.WriteFilterFunctionSpec where

import Data.Monoid
import Test.Hspec
import Foldable.ChapterExercises.WriteFilterFunction

spec :: Spec
spec = do
    describe "Test filterF" $ do
        it "filterF (const False) (1, 1)" $ do
            (filterF (const False) (1, 1) :: (Sum Integer, Product Integer)) `shouldBe` (Sum 0, Product 1)
        it "filterF (const True) (2, 2)" $ do
            (filterF (const True) (2, 2) :: (Sum Integer, Product Integer)) `shouldBe` (Sum 0, Product 2)
