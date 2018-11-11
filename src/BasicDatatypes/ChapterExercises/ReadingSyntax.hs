module BasicDatatypes.ChapterExercises.ReadingSyntax where

-- Question 1
x = (+)
f xs = w `x` 1
    where w = length xs

-- Question 2
id' = \ x -> x

-- Question 3
head' = \ (x : xs) -> x

-- Question 4
f' (a, b) = a
