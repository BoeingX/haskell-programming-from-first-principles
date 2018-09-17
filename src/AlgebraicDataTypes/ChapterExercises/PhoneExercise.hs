module AlgebraicDataTypes.ChapterExercises.PhoneExercise where

import Data.Char
import Data.List
import Control.Applicative

type Digit = Char

type Presses = Int

type Combo = (Digit, Presses)

data Button = Button Digit String

newtype DaPhone = DaPhone {getButtons :: [Button]}

-- Question 2
getCombo :: Button -> Char -> Combo
getCombo (Button x (y : ys)) c
  | y == c = (x, 1)
  | otherwise = (+1) <$> getCombo (Button x ys) c

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps daPhone c
  | isUpper c = ('*', 1) : reverseTaps daPhone (toLower c)
  | otherwise = [getCombo button c]
    where button = findButton $ getButtons daPhone
          findButton (b@(Button d s) : bs)
            | c `elem` s = b
            | otherwise = findButton bs

cellPhonesDead :: DaPhone
               -> String
               -> [(Digit, Presses)]
cellPhonesDead daPhone = concatMap (reverseTaps daPhone)

-- Question 3
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

-- Question 4
mostPopularElement :: (Eq a, Ord a) => [a] -> a
mostPopularElement = head . maximumBy (\x y -> compare (length x) (length y)) . group . sort

mostPopularLetter :: String -> Char
mostPopularLetter = mostPopularElement

-- Question 5
coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . concat

coolestWord :: [String] -> String
coolestWord = mostPopularElement . concatMap words
