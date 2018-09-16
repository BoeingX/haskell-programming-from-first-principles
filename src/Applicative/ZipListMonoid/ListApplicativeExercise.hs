module Applicative.ZipListMonoid.ListApplicativeExercise (
    List (..)
  , Arbitrary
) where

import Test.QuickCheck

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = do
        a <- arbitrary
        as <- arbitrary
        elements [Nil, Cons a as]

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

{--
A naive version using explicit pattern matching
instance Applicative List where
    pure a = Cons a Nil
    Nil <*> _ = Nil
    _   <*> Nil = Nil
    Cons f fs <*> Cons a as = pure (f a) `append` (f <$> as) `append` (fs <*> pure a) `append` (fs <*> as)
--}

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
    -- fs <*> xs = flatMap (\x -> fmap ($x) fs) xs also works, but the order is different
