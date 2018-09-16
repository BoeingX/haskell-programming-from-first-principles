module Applicative.ChapterExercises.ApplicativeInstances (
    Identity (..)
  , Pair (..)
  , Two (..)
  , Three (..)
  , Three' (..)
  , Four (..)
  , Four' (..)
) where

import Control.Applicative (liftA2, liftA3)
import Test.QuickCheck
import Test.QuickCheck.Checkers

-- Question 1
newtype Identity a = Identity a
                   deriving (Show, Eq)

instance Applicative Identity where
    pure = Identity
    Identity f <*> Identity x = Identity $ f x

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = Identity <$> arbitrary

instance (Eq a) => EqProp (Identity a) where (=-=) = eq

-- Question 2
data Pair a = Pair a a
            deriving (Show, Eq)

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

instance Applicative Pair where
    pure a = Pair a a
    Pair f g <*> Pair x y = Pair (f x) (g y)

instance (Arbitrary a) => Arbitrary (Pair a) where
    arbitrary = liftA2 Pair arbitrary arbitrary

instance (Eq a) => EqProp (Pair a) where (=-=) = eq

-- Question 3
data Two a b = Two a b
             deriving (Show, Eq)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance (Monoid a) => Applicative (Two a) where
    pure = Two mempty
    Two f g <*> Two x y = Two (f <> x) (g y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = liftA2 Two arbitrary arbitrary

instance (Eq a, Eq b) => EqProp (Two a b) where (=-=) = eq

-- Question 4
data Three a b c = Three a b c
                 deriving (Show, Eq)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure = Three mempty mempty
    Three f g h <*> Three x y z = Three (f <> x) (g <> y) (h z)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = liftA3 Three arbitrary arbitrary arbitrary

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where (=-=) = eq


-- Question 5
data Three' a b = Three' a b b
                deriving (Show, Eq)

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')

instance (Monoid a) => Applicative (Three' a) where
    pure b = Three' mempty b b
    Three' f g h <*> Three' x y z = Three' (f <> x) (g y) (h z)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = liftA3 Three' arbitrary arbitrary arbitrary

instance (Eq a, Eq b) => EqProp (Three' a b) where (=-=) = eq


-- Question 6
data Four a b c d = Four a b c d
                  deriving (Show, Eq)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure = Four mempty mempty mempty
    Four f g h i <*> Four x y z w = Four (f <> x) (g <> y) (h <> z) (i w)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = Four <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where (=-=) = eq


-- Question 7
data Four' a b = Four' a a a b
               deriving (Show, Eq)

instance Functor (Four' a) where
    fmap f (Four' a a' a'' b) = Four' a a' a'' (f b)

instance (Monoid a) => Applicative (Four' a) where
    pure = Four' mempty mempty mempty
    Four' f g h i <*> Four' x y z w = Four' (f <> x) (g <> y) (h <> z) (i w)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = Four' <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b) => EqProp (Four' a b) where (=-=) = eq
