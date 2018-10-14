{-# LANGUAGE InstanceSigs #-}
module ComposingTypes.IntermissionExercises.FoldableAndTraversableForCompose where

newtype Compose f g a = Compose { getCompose :: f (g a) }
    deriving (Eq, Show)

instance (Functor f, Functor g) => Functor (Compose f g) where
    fmap f (Compose fga) = Compose $ (fmap . fmap) f fga

-- Foldable
instance (Foldable f, Foldable g) => Foldable (Compose f g) where
    foldMap :: (Monoid m) => (a -> m) -> Compose f g a -> m
    foldMap h (Compose fga) = foldMap (foldMap h) fga

-- Traversable
instance (Traversable f, Traversable g) => Traversable (Compose f g) where
    traverse :: (Applicative h) => (a -> h b) -> Compose f g a -> h (Compose f g b)
    traverse ahb (Compose fga) = Compose <$> traverse (traverse ahb) fga
