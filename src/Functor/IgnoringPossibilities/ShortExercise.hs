module Functor.IgnoringPossibilities.ShortExercise (
    Possibly (..)
  , Sum (..)
) where

import Test.QuickCheck

data Possibly a = LolNope
                | Yeppers a
                deriving (Eq, Show)

instance Functor Possibly where
    fmap _ LolNope      = LolNope
    fmap f (Yeppers a)  = Yeppers $ f a

instance (Arbitrary a) => Arbitrary (Possibly a) where
    arbitrary = do
        a <- arbitrary
        elements [LolNope, Yeppers a]

data Sum a b = First a
             | Second b
             deriving (Eq, Show)

instance Functor (Sum a) where
    fmap _ (First a)  = First a
    fmap f (Second b) = Second $ f b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [First a, Second b]
