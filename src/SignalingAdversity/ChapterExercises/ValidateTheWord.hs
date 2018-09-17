module SignalingAdversity.ChapterExercises.ValidateTheWord where

import Data.List
newtype Word' = Word' String deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

isVowel :: Char -> Bool
isVowel = (`elem` vowels)

mkWord :: String -> Maybe Word'
mkWord s
    | length vs > length cs = Nothing
    | otherwise             = Just (Word' s)
       where (vs, cs) = partition isVowel s
