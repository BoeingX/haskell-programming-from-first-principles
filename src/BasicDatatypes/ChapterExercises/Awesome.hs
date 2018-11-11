module BasicDatatypes.ChapterExercises.Awesome where

awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

-- Question 1
-- length :: [a] -> Int
-- or length :: (Foldable t) => t a -> Int

-- Question 2
-- length [1, 2, 3, 4, 5] = 5
-- length [(1, 2), (2, 3), (3, 4)] = 3
-- length allAwesome = 2
-- length (concat allAwesome) = 5

-- Question 3
-- 6 / 3 works
-- but 6 / length [1, 2, 3] does not type check because
-- Int has no instance of Fractional

-- Question 4
-- 6 `div` length [1, 2, 3] 

-- Question 5
-- 2 + 3 == 5 :: Bool

-- Question 6
-- let x = 5
-- x + 3 == 5 :: Bool

-- Question 7
q71 = length allAwesome == 2
q72 = length ['1', 'a', '3', 'b']
q73 = length allAwesome + length awesome
q74 = (8 == 8) && ('b' < 'a')
q75 = (8 == 8) && True

-- Question 8
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

-- Question 9
myAbs :: Integer -> Integer
myAbs x = if x < 0 then -x else x

-- Question 10
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f ab cd = ((snd ab, snd cd), (fst ab, fst cd))
