{-# LANGUAGE InstanceSigs #-}
module State.WriteStateForYourself.Exercise where

newtype Moi s a = Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
    fmap :: (a -> b) -> Moi s a -> Moi s b
    fmap f (Moi g) = Moi $ \x -> let (a, s) = g x in (f a, s)

instance Applicative (Moi s) where
    pure :: a -> Moi s a
    pure a = Moi $ (,) a
    (Moi f) <*> (Moi g) = Moi $ \s -> let (ab, s') = f s
                                          (a, s'') = g s
                                      in (ab a, s'')

instance Monad (Moi s) where
    return = pure
    (>>=) :: Moi s a -> (a -> Moi s b) -> Moi s b
    (Moi f) >>= g = Moi $ \x -> let (a, s) = f x
                                    Moi h  = g a
                                in h s
