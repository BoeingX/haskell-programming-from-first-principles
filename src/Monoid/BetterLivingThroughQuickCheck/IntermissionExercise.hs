module Monoid.BetterLivingThroughQuickCheck.IntermissionExercise where

import Test.QuickCheck
import Monoid.ReusingAlgebras.Exercise

newtype First a = First { getFirst :: Optional a }
                 deriving (Eq, Show)

instance Semigroup (First a) where
    First (Only a) <> _ = First (Only a)
    First Nada     <> x = x

instance Monoid (First a) where
    mempty = First Nada

instance (Arbitrary a) => Arbitrary (First a) where
    arbitrary = do
        a <- arbitrary
        elem <- elements [Nada, Only a]
        return $ First elem
