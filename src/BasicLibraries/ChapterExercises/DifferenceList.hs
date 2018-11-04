module BasicLibraries.ChapterExercises.DifferenceList where

newtype DList a = DL { unDL :: [a] -> [a] }

empty :: DList a
empty = DL id
{-# INLINE empty #-}

singleton :: a -> DList a
singleton a = DL $ const [a]
{-# INLINE singleton #-}

toList :: DList a -> [a]
toList xs = unDL xs []
{-# INLINE toList #-}

-- Prepend a single element to a dlist.
infixr `cons`
cons :: a -> DList a -> DList a
cons x xs = DL ((x:) . unDL xs)
{-# INLINE cons #-}

-- Append a single element to a dlist.
infixl `snoc`
snoc :: DList a -> a -> DList a
snoc xs x = DL (unDL xs . (x:))
{-# INLINE snoc #-}

-- Append dlists.
append :: DList a -> DList a -> DList a
append xs ys = DL $ unDL xs . unDL ys
{-# INLINE append #-}
