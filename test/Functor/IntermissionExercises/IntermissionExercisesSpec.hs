module Functor.IntermissionExercises.IntermissionExercisesSpec where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Function
import Functor.IntermissionExercises.IntermissionExercises

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = fmap id f == f

functorCompose :: (Functor f, Eq (f c)) => (f a)
                                        -> Fun a b
                                        -> Fun b c
                                        -> Bool
functorCompose x (Fun _ f) (Fun _ g) =
    (fmap (g . f) x) == (fmap g . fmap f $ x)

type IntToInt = Fun Int Int

spec :: Spec
spec = do
    describe "Test Functor implementation of Identity, Pair, etc" $ do
        it "Identity identity" $ do
            property $ (functorIdentity :: Identity Int -> Bool)
        it "Identity compose" $ do
            property $ (functorCompose :: Identity Int -> IntToInt -> IntToInt -> Bool)
        it "Pair a identity" $ do
            property $ (functorIdentity :: Pair Int -> Bool)
        it "Pair a compose" $ do
            property $ (functorCompose :: Pair Int -> IntToInt -> IntToInt -> Bool)
        it "Two a b identity" $ do
            property $ (functorIdentity :: Two Int Int -> Bool)
        it "Two a b compose" $ do
            property $ (functorCompose :: Two Int Int -> IntToInt -> IntToInt -> Bool)
        it "Three a b c identity" $ do
            property $ (functorIdentity :: Three Int Int Int -> Bool)
        it "Three a b c compose" $ do
            property $ (functorCompose :: Three Int Int Int -> IntToInt -> IntToInt -> Bool)
        it "Three' a b identity" $ do
            property $ (functorIdentity :: Three' Int Int -> Bool)
        it "Three' a b compose" $ do
            property $ (functorCompose :: Three' Int Int -> IntToInt -> IntToInt -> Bool)
        it "Four a b c d identity" $ do
            property $ (functorIdentity :: Four Int Int Int Int -> Bool)
        it "Four a b c d compose" $ do
            property $ (functorCompose :: Four Int Int Int Int -> IntToInt -> IntToInt -> Bool)
        it "Four' a b identity" $ do
            property $ (functorIdentity :: Four' Int Int -> Bool)
        it "Four' a b compose" $ do
            property $ (functorCompose :: Four' Int Int -> IntToInt -> IntToInt -> Bool)
