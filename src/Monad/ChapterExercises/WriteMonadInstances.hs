module Monad.ChapterExercises.WriteMonadInstances where

import Test.QuickCheck
import Test.QuickCheck.Checkers

-- Question 1
data Nope a =
    NopeDotJpg
    deriving (Eq, Show)

instance Functor Nope where
    fmap _ NopeDotJpg = NopeDotJpg

instance Applicative Nope where
    pure _ = NopeDotJpg
    NopeDotJpg <*> NopeDotJpg = NopeDotJpg

instance Monad Nope where
    return = pure
    NopeDotJpg >>= _ = NopeDotJpg

instance (Arbitrary a) => Arbitrary (Nope a) where
    arbitrary = return NopeDotJpg


instance (Eq a) => EqProp (Nope a) where (=-=) = eq

-- Question 2
data PhhhbbtttEither b a =
    Left' a
  | Right' b
  deriving (Eq, Show)

instance Functor (PhhhbbtttEither b) where
    fmap f (Left' a) = Left' $ f a
    fmap _ (Right' b) = Right' b

instance Applicative (PhhhbbtttEither b) where
    pure = Left'
    Right' b <*> _ = Right' b
    _ <*> Right' b = Right' b
    Left' a <*> Left' b = Left' $ a b

instance Monad (PhhhbbtttEither b) where
    return = pure
    Right' b >>= _ = Right' b
    Left' a >>= f = f a

instance (Arbitrary a, Arbitrary b) => Arbitrary (PhhhbbtttEither b a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        elements [Left' a, Right' b]

instance (Eq a, Eq b) => EqProp (PhhhbbtttEither b a) where (=-=) = eq

-- Question 3
newtype Identity a = Identity a
    deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
    pure = Identity
    Identity f <*> Identity a = Identity $ f a

instance Monad Identity where
    return = pure
    Identity a >>= f = f a

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = Identity <$> arbitrary

instance (Eq a) => EqProp (Identity a) where (=-=) = eq

-- Question 4
data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

-- See the Applicative Chapter
append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil = b
fold f b (Cons a as) = f a (fold f b as)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f = concat' . fmap f

instance Applicative List where
    pure a = Cons a Nil
    Nil <*> _ = Nil
    _   <*> Nil = Nil
    fs <*> xs = flatMap (`fmap` xs) fs

instance Monad List where
    return = pure
    Nil >>= _ = Nil
    Cons a as >>= f = append (f a) (as >>= f)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = do
        a <- arbitrary
        as <- arbitrary
        elements [Nil, Cons a as]

instance (Eq a) => EqProp (List a) where (=-=) = eq
