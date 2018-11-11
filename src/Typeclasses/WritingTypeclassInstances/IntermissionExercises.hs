module Typeclasses.WritingTypeclassInstances.IntermissionExercises where

-- Question 1
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    TisAn x == TisAn y = x == y

-- Question 2
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    Two x y == Two x' y' = x == x' && y == y'

-- Question 3
data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    TisAnInt x      == TisAnInt y       = x == y
    TisAString x    == TisAString y     = x == y
    _               == _                = False

-- Question 4
data Pair a = Pair a a

instance (Eq a) => Eq (Pair a) where
    Pair a a' == Pair b b' = a == b && a' == b'

-- Question 5
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    Tuple a b == Tuple a' b' = a == a' && b == b'

-- Question 6
data Which a = ThisOne a | ThatOne a

instance (Eq a) => Eq (Which a) where
    ThisOne a   == ThisOne a'   = a == a'
    ThatOne a   == ThatOne a'   = a == a'
    _           == _            = False

-- Question 7
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    Hello a     == Hello a'     = a == a'
    Goodbye b   == Goodbye b'   = b == b'
    _           == _            = False
