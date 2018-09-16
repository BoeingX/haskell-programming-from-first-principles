module Applicative.ZipListMonoid.ListApplicativeExerciseSpec where

import Applicative.ZipListMonoid.ListApplicativeExercise
import Test.Hspec

spec :: Spec
spec = do
    describe "Test the ListApplicative implementation" $ do
        it "Cons (+1) (Cons (*2) Nil) <*> Cons 1 (Cons 2 Nil)" $ do
            Cons (+1) (Cons (*2) Nil) <*> Cons 1 (Cons 2 Nil) `shouldBe` Cons 2 (Cons 3 (Cons 2 (Cons 4 Nil)))
