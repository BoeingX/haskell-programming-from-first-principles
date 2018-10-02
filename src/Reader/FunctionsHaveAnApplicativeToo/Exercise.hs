module Reader.FunctionsHaveAnApplicativeToo.Exercise where

newtype Reader r a = Reader { runReader :: r -> a }

-- Question 1
myLiftA2 :: Applicative f =>
         (a -> b -> c)
      -> f a -> f b -> f c
myLiftA2 f a b = f <$> a <*> b

-- Question 2
asks :: (r -> a) -> Reader r a
asks f = Reader f

-- Question 3
instance Functor (Reader r) where
    fmap f (Reader ra) = Reader $ f . ra

instance Applicative (Reader r) where
    pure = Reader . const
    Reader f <*> Reader ra = Reader $ myLiftA2 ($) f ra
    -- Or more explicitely
    -- Reader f <*> Reader ra = Reader $ \r -> (f r) (ra r)

-- Question 4
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

getDogR :: Reader Person Dog
getDogR = Dog <$> Reader dogName <*> Reader address
