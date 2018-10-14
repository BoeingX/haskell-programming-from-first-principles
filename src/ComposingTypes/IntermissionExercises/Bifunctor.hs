module ComposingTypes.IntermissionExercises.Bifunctor where

-- It’s a functor that can map over two type arguments instead of just one.
class Bifunctor p where
    {-# MINIMAL bimap | first, second #-}
    bimap :: (a -> b) -> (c -> d) -> p a c -> p b d
    bimap f g = first f . second g

    first :: (a -> b) -> p a c -> p b c
    first f = bimap f id

    second :: (b -> c) -> p a b -> p a c
    second = bimap id


-- Question 1
data Deux a b = Deux a b

instance Bifunctor Deux where
    bimap f g (Deux a b) = Deux (f a) (g b)

-- Question 2
data Const a b = Const a

instance Bifunctor Const where
    bimap f _ (Const a) = Const (f a)

-- Question 3
data Drei a b c = Drei a b c

instance Bifunctor (Drei a) where
    bimap f g (Drei a b c) = Drei a (f b) (g c)

-- Question 4
data SuperDrei a b c = SuperDrei a b

instance Bifunctor (SuperDrei a) where
    bimap f _ (SuperDrei a b) = SuperDrei a (f b)

-- Question 5
data SemiDrei a b c = SemiDrei a

instance Bifunctor (SemiDrei a) where
    bimap _ _ (SemiDrei a) = SemiDrei a

-- Question 6
data Quadriceps a b c d = Quadzzz a b c d

instance Bifunctor (Quadriceps a b) where
    bimap f g (Quadzzz a b c d) = Quadzzz a b (f c) (g d)

-- Question 7
data Either' a b = Left' a | Right' b

instance Bifunctor Either' where
    bimap f _ (Left' a) = Left' $ f a
    bimap _ g (Right' b) = Right' $ g b
