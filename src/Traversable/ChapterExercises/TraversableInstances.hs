module Traversable.ChapterExercises.TraversableInstances where

import Test.QuickCheck
import Test.QuickCheck.Checkers

-- Identity
newtype Identity a = Identity a
    deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Foldable Identity where
    foldMap f (Identity a) = f a

instance Traversable Identity where
    traverse f (Identity a) = Identity <$> f a

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = Identity <$> arbitrary

instance (Eq a) => EqProp (Identity a) where (=-=) = eq

-- Constant
newtype Constant a b = Constant { getConstant :: a }
    deriving (Eq, Ord, Show)

instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a

instance Foldable (Constant a) where
    foldMap _ (Constant a) = mempty

instance Traversable (Constant a) where
    traverse f (Constant a) = pure $ Constant a

instance (Arbitrary a) => Arbitrary (Constant a b) where
    arbitrary = Constant <$> arbitrary

instance (Eq a) => EqProp (Constant a b) where (=-=) = eq

-- Maybe
data Optional a = Nada
                | Yep a
                deriving (Eq, Ord, Show)

instance Functor Optional where
    fmap _ Nada = Nada
    fmap f (Yep a) = Yep $ f a

instance Applicative Optional where
    pure = Yep
    Nada <*> _ = Nada
    _ <*> Nada = Nada
    Yep f <*> Yep x = Yep $ f x

instance Foldable Optional where
    foldMap _ Nada = mempty
    foldMap f (Yep a) = f a

instance Traversable Optional where
    traverse _ Nada = pure Nada
    traverse f (Yep x) = Yep <$> f x

instance (Arbitrary a) => Arbitrary (Optional a) where
    arbitrary = do
        a <- arbitrary
        elements [Nada, Yep a]

instance (Eq a) => EqProp (Optional a) where (=-=) = eq

data List a = Nil
            | Cons a (List a)
            deriving (Eq, Ord, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

instance Foldable List where
    foldr _ b Nil = b
    foldr f b (Cons a as) = f a (foldr f b as)

instance Traversable List where
    traverse _ Nil = pure Nil
    traverse f (Cons a as) = Cons <$> f a <*> traverse f as
    
instance Arbitrary a => Arbitrary (List a) where
    arbitrary = do
        a <- arbitrary
        as <- arbitrary
        elements [Nil, Cons a as]

instance (Eq a) => EqProp (List a) where (=-=) = eq

-- Three
data Three a b c = Three a b c
    deriving (Eq, Ord, Show)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b $ f c

instance Foldable (Three a b) where
    foldMap f (Three a b c) = f c

instance Traversable (Three a b) where
    traverse f (Three a b c) = Three a b <$> f c

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = Three <$> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where (=-=) = eq

-- Three'
data Three' a b = Three' a b b
    deriving (Eq, Ord, Show)

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')

instance Foldable (Three' a) where
    foldMap f (Three' a b b') = f b <> f b'

instance Traversable (Three' a) where
    traverse f (Three' a b b') = Three' a <$> f b <*> f b'

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b)  where
    arbitrary = Three' <$> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b) => EqProp (Three' a b) where (=-=) = eq

-- S
data S n a = S (n a) a
    deriving (Eq, Ord, Show)

instance (Functor n) => Functor (S n) where
    fmap f (S n a) = S (fmap f n) (f a)

instance (Foldable n) => Foldable (S n) where
    foldMap f (S n a) = (foldMap f n) <> (f a)

instance (Traversable n) => Traversable (S n) where
    traverse f (S n a) = S <$> (traverse f n) <*> (f a)

instance (Arbitrary a, Arbitrary (n a)) => Arbitrary (S n a) where
    arbitrary = S <$> arbitrary <*> arbitrary

instance (Eq a, Eq (n a)) => EqProp (S n a) where (=-=) = eq
