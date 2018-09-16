{-# LANGUAGE FlexibleInstances #-}
module Functor.ChapterExercises.WriteFunctorInstances where

-- Question 1
data Quant a b = Finance
               | Desk a
               | Bloor b

instance Functor (Quant a) where
    fmap _ Finance = Finance
    fmap _ (Desk a) = Desk a
    fmap f (Bloor b) = Bloor $ f b

-- Question 2
data K a b = K a

instance Functor (K a) where
    fmap _ (K a) = K a

-- Question 3
newtype Flip f a b = Flip (f b a)
                   deriving (Eq, Show)

newtype K' a b = K' a

instance Functor (Flip K' a) where
    -- fmap :: (b -> c) -> Flip K a b -> Flip K a c
    fmap f (Flip (K' b)) = Flip $ K' $ f b
    --     \Flip K' a b/   \_Flip K' a c_/

-- Question 4
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst $ f b

-- Question 5
data LiftItOut f a = LiftItOut (f a)

instance (Functor f) => Functor (LiftItOut f) where
    fmap g (LiftItOut f) = LiftItOut $ fmap g f

-- Question 6
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap h (DaWrappa f g) = DaWrappa (fmap h f) (fmap h g)

-- Question 7
data IgnoreOne f g a b = IgnoringSomething (f a) (g b)

instance (Functor g) => Functor (IgnoreOne f g a) where
    fmap h (IgnoringSomething f g) = IgnoringSomething f (fmap h g)

-- Question 8
data Notorious g o a t = Notorious (g o) (g a) (g t)

instance (Functor g) => Functor (Notorious g o a) where
    fmap f (Notorious g' g'' g''') = Notorious g' g'' (fmap f g''')

-- Question 9
data List a = Nil | Cons a (List a)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

-- Question 10
data GoatLord a = NoGoat
                | OneGoat a
                | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
    fmap _ NoGoat = NoGoat
    fmap f (OneGoat a) = OneGoat $ f a
    fmap f (MoreGoats l m r) = MoreGoats (fmap f l) (fmap f m) (fmap f r)

-- Question 11
data TalkToMe a = Halt
                | Print String a
                | Read (String -> a)

instance Functor TalkToMe where
    fmap _ Halt = Halt
    fmap f (Print s a) = Print s (f a)
    fmap f (Read g) = Read (f . g)
