module MonadTransformers.LexicallyInnerIsStructurallyOuter.Exercise where

import Control.Monad.Trans.Except
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader

embedded :: MaybeT (ExceptT String (ReaderT () IO)) Int
embedded = MaybeT $ ExceptT $ ReaderT $ return <$> const (Right (Just 1))

-- Or more explicitely
embedded' :: MaybeT (ExceptT String (ReaderT () IO)) Int
embedded' = MaybeT ma
    where ma :: (ExceptT String (ReaderT () IO)) (Maybe Int)
          ma = ExceptT mb
            where mb :: (ReaderT () IO) (Either String (Maybe Int))
                  mb = ReaderT mc
                    where mc :: () -> IO (Either String (Maybe Int))
                          mc = return <$> const (Right (Just 1))
