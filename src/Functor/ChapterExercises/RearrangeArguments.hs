module Functor.ChapterExercises.RearrangeArguments (
    More (..)
) where

data Sum a b = First a | Second b

instance Functor (Sum e) where
    fmap _ (First a) = First a
    fmap f (Second b) = Second $ f b

data Company a b c = DeepBlue a c | Something b
instance Functor (Company e e') where
    fmap f (DeepBlue a c) = DeepBlue  a (f c)
    fmap _ (Something b)  = Something b

data More a b = L b a b | R a b a
                deriving (Eq, Show)
instance Functor (More x) where
    fmap f (L a b a') = L (f a) b (f a')
    fmap f (R b a b') = R b (f a) b'
