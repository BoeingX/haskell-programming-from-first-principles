module MonadTransformers.EitherT.Exercises where

import Control.Applicative (liftA2)

newtype EitherT e m a = EitherT { runEitherT :: m (Either e a) }

-- Question 1
instance (Functor m) => Functor (EitherT e m) where
    fmap f (EitherT mea) = EitherT $ (fmap . fmap) f mea

-- Question 2
instance (Applicative m) => Applicative (EitherT e m) where
    pure = EitherT . pure . pure
    EitherT fmeab <*> EitherT mea = EitherT $ liftA2 (<*>) fmeab mea

-- Question 3
instance (Monad m) => Monad (EitherT e m) where
    return = pure
    EitherT mea >>= f = EitherT $ do
        ea <- mea
        case ea of
          Left e -> return (Left e)
          Right a -> (runEitherT . f) a

-- Question 4
swapEither :: Either e a -> Either a e
swapEither (Left e) = Right e
swapEither (Right a) = Left a

swapEitherT :: (Functor m) => EitherT e m a -> EitherT a m e
swapEitherT (EitherT mea) = EitherT (fmap swapEither mea)

-- Question 5
eitherT :: Monad m => (a -> m c) -> (b -> m c) -> EitherT a m b -> m c
eitherT f g (EitherT mab) = do
    ab <- mab
    case ab of
      Left a -> f a
      Right b -> g b
