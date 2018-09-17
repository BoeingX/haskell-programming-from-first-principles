{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
module AlgebraicDataTypes.WhatMakesDataTypesAlgebraic.NewType where

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- Question 1
instance TooMany (Int, String) where
    tooMany (n, _) = n > 42

-- Question 2
instance TooMany (Int, Int) where
    tooMany (n', n'') = n' + n'' > 42

-- Question3
instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany (n', n'') = (tooMany n') || (tooMany n'')
