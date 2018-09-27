module Foldable.ChapterExercises.WriteFoldableInstances where

-- Question 1
data Constant a b = Constant a
    deriving (Show, Eq)

instance Foldable (Constant a) where
    foldMap _ (Constant a) = mempty

data Two a b = Two a b
    deriving (Show, Eq)

instance Foldable (Two a) where
    foldMap f (Two a b) = f b

data Three a b c = Three a b c
    deriving (Show, Eq)

instance Foldable (Three a b) where
    foldMap f (Three a b c) = f c

data Three' a b = Three' a b b
    deriving (Show, Eq)

instance Foldable (Three' a) where
    foldMap f (Three' a b b') = f b `mappend` f b'

data Four' a b = Four' a b b b
    deriving (Show, Eq)

instance Foldable (Four' a) where
    foldMap f (Four' a b b' b'') = mconcat [f b, f b', f b'']
