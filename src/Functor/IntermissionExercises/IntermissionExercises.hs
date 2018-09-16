module Functor.IntermissionExercises.IntermissionExercises (
    Identity (..)
  , Pair (..)
  , Two (..)
  , Three (..)
  , Three' (..)
  , Four (..)
  , Four' (..)
) where

import Test.QuickCheck

-- Question 1
newtype Identity a = Identity a
                    deriving (Show, Eq)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = do
        a <- arbitrary
        return $ Identity a

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

-- Question 2
data Pair a = Pair a a
            deriving (Show, Eq)

instance (Arbitrary a) => Arbitrary (Pair a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Pair a b

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

-- Question 3
data Two a b = Two a b
             deriving (Show, Eq)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Two a b

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

-- Question 4
data Three a b c = Three a b c
                 deriving (Show, Eq)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        return $ Three a b c

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

-- Question 5
data Three' a b = Three' a b b
                deriving (Show, Eq)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        b' <- arbitrary
        return $ Three' a b b'

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')

-- Question 6
data Four a b c d = Four a b c d
                  deriving (Show, Eq)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four a b c d

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

-- Question 7
data Four' a b = Four' a a a b
               deriving (Show, Eq)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = do
        a <- arbitrary
        a' <- arbitrary
        a'' <- arbitrary
        b <- arbitrary
        return $ Four' a a' a'' b

instance Functor (Four' a) where
    fmap f (Four' a a' a'' b) = Four' a a' a'' (f b)

{--
However, it is not possible to implement an instance of Functor for
data Trivial = Trivial

because the kind of Trivial is *
whereas Functor requires * -> *.
--}
