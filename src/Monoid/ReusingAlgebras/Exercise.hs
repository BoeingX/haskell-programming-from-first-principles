module Monoid.ReusingAlgebras.Exercise where

data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Optional a) where
    (<>) (Only x) (Only y) = Only (x <> y)
    (<>) Nada     x        = x
    (<>) x        Nada     = x

instance Monoid a => Monoid (Optional a) where
    mempty = Nada
