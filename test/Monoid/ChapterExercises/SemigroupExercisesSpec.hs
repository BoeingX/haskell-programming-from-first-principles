module Monoid.ChapterExercises.SemigroupExercisesSpec where

import Test.Hspec
import Test.QuickCheck
import Monoid.ChapterExercises.SemigroupExercises

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

spec :: Spec
spec = do
    describe "Test Semigroup implementations" $ do
        it "Trivial" $ do
            property (semigroupAssoc :: Trivial -> Trivial -> Trivial -> Bool)
        it "Identity a" $ do
            property (semigroupAssoc :: Identity String -> Identity String -> Identity String -> Bool)
        it "Two a b" $ do
            property (semigroupAssoc :: Two String String -> Two String String ->Two String String -> Bool)
        it "BoolConj" $ do
            property (semigroupAssoc :: BoolConj -> BoolConj -> BoolConj -> Bool)
        it "BoolDisj" $ do
            property (semigroupAssoc :: BoolDisj -> BoolDisj -> BoolDisj -> Bool)
        it "Or a b" $ do
            property (semigroupAssoc :: Or Integer Integer -> Or Integer Integer -> Or Integer Integer -> Bool)
        it "Validation a b" $ do
            property (semigroupAssoc :: Validation String String -> Validation String String -> Validation String String -> Bool)
        it "AccumulateRight a b" $ do
            property (semigroupAssoc :: AccumulateRight String String -> AccumulateRight String String -> AccumulateRight String String -> Bool)
        it "AccumulateBoth a b" $ do
            property (semigroupAssoc :: AccumulateBoth String String -> AccumulateBoth String String -> AccumulateBoth String String -> Bool)
