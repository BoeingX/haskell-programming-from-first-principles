module Typeclasses.ChapterExercises.TypeKwonDo where

-- Question 1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a = (==) (f a)

-- Question 2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f _ = f
