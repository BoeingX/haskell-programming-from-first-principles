module Foldable.ChapterExercises.WriteFilterFunction where

filterF :: (Applicative f, Foldable f, Monoid (f a)) => (a -> Bool) -> f a -> f a
filterF f = foldMap (\a -> if f a then pure a else mempty)
