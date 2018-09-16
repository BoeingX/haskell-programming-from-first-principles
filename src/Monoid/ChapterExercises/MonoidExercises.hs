module Monoid.ChapterExercises.MonoidExercises where

import Monoid.ChapterExercises.SemigroupExercises

-- Question 1
instance Monoid Trivial where
    mempty = Trivial

-- Question 2
instance (Monoid a) => Monoid (Identity a) where
    mempty = Identity mempty

-- Question 3
instance (Monoid a, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty

-- Question 4
instance Monoid BoolConj where
    mempty = BoolConj True

-- Question 5
instance Monoid BoolDisj where
    mempty = BoolDisj False

-- Question 6
instance (Monoid b) => Monoid (Combine a b) where
    mempty = Combine mempty

-- Question 7
instance (Semigroup a) => Monoid (Comp a) where
    mempty = Comp id

-- Question 8
newtype Mem s a =
    Mem {
        runMem :: s -> (a,s)
    }

instance (Semigroup a) => Semigroup (Mem s a) where
    Mem f <> Mem g = Mem h
        where h s = (a' <> a'', s'')
                    where (a', s') = f s
                          (a'', s'') = g s'

-- Question 9
instance (Monoid a) => Monoid (Mem s a) where
    mempty = Mem $ \s -> (mempty, s)
