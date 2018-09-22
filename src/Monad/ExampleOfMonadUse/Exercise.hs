module Monad.ExampleOfMonadUse.Exercise where

import Test.QuickCheck
import Test.QuickCheck.Checkers

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
    fmap _ (First a) = First a
    fmap f (Second b) = Second $ f b

instance Applicative (Sum a) where
    pure = Second
    First a <*> _ = First a
    Second b <*> First a = First a
    Second b <*> Second b' = Second $ b b'

instance Monad (Sum a) where
    return = pure
    First a >>= _ = First a
    Second b >>= f = f b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [First a, Second b]

instance (Eq a, Eq b) => EqProp (Sum a b) where (=-=) = eq
