module ComposingTypes.Twinplicative.Exercise where
    
import Control.Applicative (liftA2)

newtype Compose f g a = Compose { getCompose :: f (g a) }
    deriving (Eq, Show)

instance (Functor f, Functor g) => Functor (Compose f g) where
    fmap f (Compose fga) = Compose $ (fmap . fmap) f fga

instance (Applicative f, Applicative g) => Applicative (Compose f g) where
    pure = Compose . pure . pure
    Compose fgab <*> Compose fga = Compose $ liftA2 (<*>) fgab fga
