module Applicative.ApplicativeInUse.MaybeExercise () where

maybe :: Maybe String
maybe = const <$> Just "Hello" <*> pure "World"

maybe' :: Maybe (Int, Int, String, [Int])
maybe' = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]
