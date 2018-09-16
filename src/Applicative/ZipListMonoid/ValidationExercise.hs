module Applicative.ZipListMonoid.ValidationExercise (
    Sum (..)
  , Validation (..)
) where

import Test.QuickCheck
import Test.QuickCheck.Checkers

data Sum a b = First a
             | Second b
             deriving (Eq, Show)

instance Functor (Sum a) where
    fmap _ (First a) = First a
    fmap f (Second b) = Second $ f b

instance Applicative (Sum a) where
    pure = Second
    First a <*> _ = First a
    _ <*> First a = First a
    Second f <*> Second b = Second $ f b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [First a, Second b]

instance (Eq a, Eq b) => EqProp (Sum a b) where (=-=) = eq

-- We rename Error and Success to Err and Succ
-- since QuickCheck already exports these names
data Validation e a = Err e
                    | Succ a
                    deriving (Eq, Show)

-- same as Sum/Either
instance Functor (Validation e) where
    fmap _ (Err e) = Err e
    fmap f (Succ a) = Succ $ f a

-- This is different
instance Monoid e => Applicative (Validation e) where
    pure = Succ
    Err e1 <*> Err e2 = Err $ e1 <> e2
    Err e <*> _ = Err e
    _ <*> Err e = Err e
    Succ f <*> Succ a = Succ $ f a

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [Err a, Succ b]

instance (Eq a, Eq b) => EqProp (Validation a b) where (=-=) = eq
