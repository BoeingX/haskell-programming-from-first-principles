module Applicative.ChapterExercises.Combinations (
    stops
  , vowels
  , combos
) where

import Control.Applicative (liftA3)

stops, vowels :: String
stops = "pbtdkg"
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)
