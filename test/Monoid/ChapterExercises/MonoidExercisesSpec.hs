module Monoid.ChapterExercises.MonoidExercisesSpec where

import Test.Hspec
import Test.QuickCheck
import Monoid.ChapterExercises.SemigroupExercises
import Monoid.ChapterExercises.MonoidExercises

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty <> a) == a

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a <> mempty) == a

spec :: Spec
spec = do
    describe "Test Monoid implementations" $ do
        it "Trivial Left identity" $ do
            property (monoidLeftIdentity :: Trivial -> Bool)
        it "Trivial Right identity" $ do
            property (monoidRightIdentity :: Trivial -> Bool)
        it "Identity Left identity" $ do
            property (monoidLeftIdentity :: Identity String -> Bool)
        it "Identity Right identity" $ do
            property (monoidRightIdentity :: Identity String -> Bool)
        it "Two Left identity" $ do
            property (monoidLeftIdentity :: Two String String -> Bool)
        it "Two Right identity" $ do
            property (monoidRightIdentity :: Two String String -> Bool)
        it "BoolConj Left identity" $ do
            property (monoidLeftIdentity :: BoolConj -> Bool)
        it "BoolConj Right identity" $ do
            property (monoidRightIdentity :: BoolConj -> Bool)
        it "BoolDisj Left identity" $ do
            property (monoidLeftIdentity :: BoolDisj -> Bool)
        it "BoolDisj Right identity" $ do
            property (monoidRightIdentity :: BoolDisj -> Bool)
    describe "Mem implementation" $ do
        let f' = Mem $ \s -> ("hi", s + 1) 
        it "runMem (f' <> mempty) 0" $ do
            runMem (f' <> mempty) 0 `shouldBe` ("hi",1)
        it "runMem (mempty <> f') 0" $ do
            runMem (mempty <> f') 0 `shouldBe` ("hi",1)
        it "(runMem mempty 0 :: (String, Int))" $ do
            (runMem mempty 0 :: (String, Int)) `shouldBe` ("",0)
        it "runMem (f' <> mempty) 0 == runMem f' 0" $ do
            runMem (f' <> mempty) 0 == runMem f' 0 `shouldBe` True
        it "runMem (mempty <> f') 0 == runMem f' 0" $ do
            runMem (mempty <> f') 0 == runMem f' 0 `shouldBe` True
