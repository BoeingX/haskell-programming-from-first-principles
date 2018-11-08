module Lists.UsingRangesToConstructLists.Exercise where

eftBool :: Bool -> Bool -> [Bool]
eftBool x y
  | x == y = [x]
eftBool False _ = [False, True]
eftBool True False = []

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y
  | x == y = [x]
  | x > y = []
  | otherwise = x : eftOrd (succ x) y

eftInt :: Int -> Int -> [Int]
eftInt x y
  | x == y = [x]
  | x > y = []
  | otherwise = x : eftInt (succ x) y

eftChar :: Char -> Char -> [Char]
eftChar x y
  | x == y = [x]
  | x > y = []
  | otherwise = x : eftChar (succ x) y
