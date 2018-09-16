module Monoid.ChapterExercises.SemigroupExercises where

import Data.Monoid
import Test.QuickCheck

-- Question 1
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

-- Question 2
newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
    Identity a <> Identity b = Identity $ a <> b

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = do
        a <- arbitrary
        return $ Identity a

-- Question 3
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two a b <> Two c d = Two (a <> c) (b <> d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Two a b

-- Question 6
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj True <> BoolConj True = BoolConj True
    _             <> _             = BoolConj False

instance Arbitrary BoolConj where
    arbitrary = do
        a <- arbitrary
        return $ BoolConj a

-- Question 7
newtype BoolDisj = BoolDisj Bool
                deriving (Eq, Show)

instance Semigroup BoolDisj where
    BoolDisj False <> BoolDisj False = BoolDisj False
    _              <> _              = BoolDisj True

instance Arbitrary BoolDisj where
    arbitrary = do
        a <- arbitrary
        return $ BoolDisj a

-- Question 8
data Or a b = Fst a
            | Snd b
            deriving (Eq, Show)

instance Semigroup (Or a b) where
    Snd b <> _     = Snd b
    _     <> Snd b = Snd b
    a     <> b     = b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [Fst a, Snd b]

-- Question 9
newtype Combine a b = Combine { unCombine :: (a -> b) }

instance (Semigroup b) => Semigroup (Combine a b) where
    Combine f <> Combine g = Combine (\x -> f x <> g x)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
    arbitrary = do
        f <- arbitrary
        return $ Combine f

-- Question 10
newtype Comp a = Comp { unComp :: (a -> a) }

instance (Semigroup a) => Semigroup (Comp a) where
    Comp f <> Comp g = Comp (\x -> f x <> g x)

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
    arbitrary = do
        f <- arbitrary
        return $ Comp f

-- Question 11
data Validation a b = Failure' a | Success' b
                    deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
    Failure' a <> Failure' b = Failure' $ a <> b
    Success' a <> _          = Success' a
    _          <> Success' a = Success' a

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [Failure' a, Success' b]

-- Question 12

newtype AccumulateRight a b = AccumulateRight (Validation a b)
                            deriving (Eq, Show)

instance Semigroup b => Semigroup (AccumulateRight a b) where
    AccumulateRight (Success' a) <> AccumulateRight (Success' b) = 
        AccumulateRight (Success' $ a <> b)
    AccumulateRight (Failure' a) <> _ = 
        AccumulateRight (Failure' a)
    _ <> AccumulateRight (Failure' a) = 
        AccumulateRight (Failure' a)

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateRight a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- elements [Failure' a, Success' b]
        return $ AccumulateRight c

-- Question 13
newtype AccumulateBoth a b = AccumulateBoth (Validation a b)
                           deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (AccumulateBoth a b) where
    AccumulateBoth (Success' a) <> AccumulateBoth (Success' b) =
        AccumulateBoth $ Success' $ a <> b
    AccumulateBoth (Failure' a) <> AccumulateBoth (Failure' b) =
        AccumulateBoth $ Failure' $ a <> b
    AccumulateBoth (Failure' a) <> _ = AccumulateBoth $ Failure' a
    _ <> AccumulateBoth (Failure' a) = AccumulateBoth $ Failure' a

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateBoth a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- elements [Failure' a, Success' b]
        return $ AccumulateBoth c
