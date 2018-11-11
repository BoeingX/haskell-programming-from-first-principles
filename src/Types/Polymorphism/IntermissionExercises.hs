module Types.Polymorphism.IntermissionExercises where

-- Question 1
-- It is not possible to do other things than return the same value
id' :: a -> a
id' a = a

-- Question 2
-- Only two possible implementations
func :: a -> a -> a
func a b = a

func' :: a -> a -> a
func' a b = b

-- Question 3
-- Only one implementation
func'' :: a -> b -> b
func'' _ b = b
