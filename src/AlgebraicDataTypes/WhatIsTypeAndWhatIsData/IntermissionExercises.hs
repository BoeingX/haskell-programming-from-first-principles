module AlgebraicDataTypes.WhatIsTypeAndWhatIsData.IntermissionExercises where

data Price = Price Integer deriving (Eq, Show)

data Size = Size Integer deriving (Eq, Show)

data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving (Eq, Show)

data Airline = PapuAir
             | CatapultsR'Us
             | TakeYourChancesUnited
             deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Size
             deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge  = Plane PapuAir (Size 42)

-- Question 1
-- The type of `MyCar` is `MyCar :: Vehicle`

-- Question 2
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _         = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- Question 3
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
getManu _         = error "This should not happen!"

-- Question 4
-- An error would be thrown if `getManu` is used on `Plane` data.

-- Question 5
-- c.f. above
