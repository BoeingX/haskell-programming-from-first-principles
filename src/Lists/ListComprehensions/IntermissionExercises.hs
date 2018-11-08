module Lists.ListComprehensions.IntermissionExercises where

mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- Question 1
mySqrCube = [(x, y) | x <- mySqr, y <- myCube]

-- Question 2
mySqrCube' = [(x, y) | x <- mySqr, y <- myCube, x <= 50, y<= 50]

-- Question 3
len = length mySqrCube'
