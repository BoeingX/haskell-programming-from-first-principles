module Reader.ChapterExercises.WarmUpStretch where

import Control.Applicative
import Data.Maybe

x = [1, 2, 3]
y = [4, 5, 6]
z = [7, 8, 9]

lookup' :: Eq a => a -> [(a, b)] -> Maybe b
lookup' _ [] = Nothing
lookup' a ((x', x''):xs)
  | a == x'     = Just x''
  | otherwise   = lookup' a xs

xs :: Maybe Integer
xs = lookup' 3 $ zip x y

ys :: Maybe Integer
ys = lookup' 6 $ zip y z 

zs :: Maybe Integer
zs = lookup 4 $ zip x y

-- now zip x and z using a variable lookup key
z' :: Integer -> Maybe Integer
z' n = lookup' n $ zip x z

-- Have x1 make a tuple of xs and ys
x1 :: Maybe (Integer, Integer)
x1 = liftA2 (,) xs ys

-- and x2 make a tuple of ys and zs
x2 :: Maybe (Integer, Integer)
x2 = liftA2 (,) ys zs

-- x3 which takes one input and makes a tuple of the results of two applications of z' from above
x3 :: Integer -> (Maybe Integer, Maybe Integer)
x3 = liftA2 (,) z' z'

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (a, b) = f a b

summed :: Num c => (c, c) -> c
summed = uncurry' (+)

bolt :: Integer -> Bool
-- use &&, >3, <8
bolt = liftA2 (&&) (>3) (<8)

fromMaybe' :: a -> Maybe a -> a
fromMaybe' _ (Just a) = a
fromMaybe' a Nothing  = a

sequA :: Integral a => a -> [Bool]
sequA m = sequenceA [(>3), (<8), even] m

s' :: Maybe Integer
s' = summed <$> ((,) <$> xs <*> ys)
