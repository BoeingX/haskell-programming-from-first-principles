module Reader.TheMonadOfFunctions.Exercise where

import Control.Applicative (liftA2)

newtype Reader r a = Reader { runReader :: r -> a }

instance Functor (Reader r) where
    fmap f (Reader ra) = Reader $ f . ra

instance Applicative (Reader r) where
    pure = Reader . const
    Reader f <*> Reader ra = Reader $ liftA2 ($) f ra

-- Question 1
instance Monad (Reader r) where
    return = pure
    (Reader ra) >>= aRb = Reader $ \r -> runReader (aRb (ra r)) r

-- Question 2
newtype HumanName = HumanName String
    deriving (Eq, Show)

newtype DogName = DogName String
    deriving (Eq, Show)

newtype Address = Address String
    deriving (Eq, Show)

data Person = Person {
             humanName :: HumanName
           , dogName :: DogName
           , address :: Address
           } deriving (Eq, Show)

data Dog = Dog {
            dogsName :: DogName
          , dogsAddress :: Address
            } deriving (Eq, Show)

getDogRM :: Reader Person Dog
getDogRM = do
    name <- Reader dogName
    addr <- Reader address
    return $ Dog name addr
-- or without do syntax
-- getDogRM = Reader dogName >>= \name -> Reader address >>= \addr -> return $ Dog name addr
