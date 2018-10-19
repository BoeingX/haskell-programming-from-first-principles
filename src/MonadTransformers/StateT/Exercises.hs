module MonadTransformers.StateT.Exercises where

import Control.Applicative

newtype StateT s m a = StateT { runStateT :: s -> m (a, s)}

instance (Functor m) => Functor (StateT s m) where
    fmap f (StateT sma) = StateT $ \s -> fmap f' (sma s)
        where f' (a, s) = (f a, s)

-- See this Stackoverflow post the reason why we need a Monad instance of m
-- https://stackoverflow.com/questions/18673525/is-it-possible-to-implement-applicative-m-applicative-statet-s-m
instance (Monad m) => Applicative (StateT s m) where
    pure a = StateT $ \s -> pure (a, s)
    StateT smab <*> StateT sma = StateT $ \s -> do
        (ab, s') <- smab s
        (a, s'') <- sma s'
        return (ab a, s'')

instance (Monad m) => Monad (StateT s m) where
    return = pure
    StateT sma >>= asmb = StateT $ \s -> do
        (a, s') <- sma s
        runStateT (asmb a) s'
