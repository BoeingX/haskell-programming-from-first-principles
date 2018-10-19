module MonadTransformers.MonadIO.Exercises where

import Control.Monad.IO.Class
import Control.Monad.Trans.Class

-- MaybeT
newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance (Functor m) => Functor (MaybeT m) where
    fmap = undefined

instance (Applicative m) => Applicative (MaybeT m) where
    pure = undefined
    (<*>) = undefined

instance (Monad m) => Monad (MaybeT m) where
    return = pure
    (>>=) = undefined

instance MonadTrans MaybeT where
    lift = MaybeT . fmap Just

instance (MonadIO m) => MonadIO (MaybeT m) where
    liftIO = lift . liftIO

-- ReaderT
newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a }

instance (Functor m) => Functor (ReaderT r m) where
    fmap = undefined

instance (Applicative m) => Applicative (ReaderT r m) where
    pure = undefined
    (<*>) = undefined

instance (Monad m) => Monad (ReaderT r m) where
    return = pure
    (>>=) = undefined

instance MonadTrans (ReaderT r) where
    lift = ReaderT . const

instance (MonadIO m) => MonadIO (ReaderT r m) where
    liftIO = lift . liftIO

-- StateT
newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }

instance (Functor m) => Functor (StateT s m) where
    fmap = undefined

instance (Monad m) => Applicative (StateT s m) where
    pure = undefined
    (<*>) = undefined

instance (Monad m) => Monad (StateT s m) where
    return = pure
    (>>=) = undefined

instance MonadTrans (StateT s) where
    lift ma = StateT $ \s -> do
                                a <- ma
                                return (a, s)

instance (MonadIO m ) => MonadIO (StateT s m) where
    liftIO = lift . liftIO
