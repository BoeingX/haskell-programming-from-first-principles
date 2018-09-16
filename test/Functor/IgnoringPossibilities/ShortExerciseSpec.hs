module Functor.IgnoringPossibilities.ShortExerciseSpec where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Function
import Functor.IgnoringPossibilities.ShortExercise

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
    describe "Test Functor implementation of Possibly and Sum" $ do
        it "Possibly identity" $ do
            property $ (functorIdentity :: Possibly Int -> Bool)
        it "Possibly compose" $ do
            property $ (functorCompose :: Possibly Int -> IntToInt -> IntToInt -> Bool)
        it "Sum identity" $ do
            property $ (functorIdentity :: Sum Int Int -> Bool)
        it "Sum compose" $ do
            property $ (functorCompose :: Sum Int Int -> IntToInt -> IntToInt -> Bool)
