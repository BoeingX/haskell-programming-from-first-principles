module Monoid.ReusingAlgebras.ExerciseSpec where

import Data.Monoid
import Test.Hspec
import Test.QuickCheck
import Monoid.ReusingAlgebras.Exercise

monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

firstMappend :: First a -> First a -> First a
firstMappend = mappend

type FirstMappend = First String
                  -> First String
                  -> First String
                  -> Bool

spec :: Spec
spec = do
  describe "Optional is monoid" $ do
    it "mappend of two Only Sum type should be Only the sum" $ do
      Only (Sum 1) `mappend` Only (Sum 1) `shouldBe` Only (Sum 2)
    it "mappend of two Only Product type should be Only the product" $ do
      Only (Product 4) `mappend` Only (Product 2) `shouldBe` Only (Product 8)
    it "mappend right Nada should always be the first" $ do
      property $ \x -> Only (Sum x) `mappend` Nada == Only (Sum (x :: Int))
    it "mappend left Nada should always be the second" $ do
      property $ \x -> Nada `mappend` Only x == Only (x :: [Int])
