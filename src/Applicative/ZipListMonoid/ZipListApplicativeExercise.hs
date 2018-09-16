module Applicative.ZipListMonoid.ZipListApplicativeExercise (
    ZipList' (..)
) where

import Test.QuickCheck
import Test.QuickCheck.Checkers
import Applicative.ZipListMonoid.ListApplicativeExercise

newtype ZipList' a = ZipList' (List a)
                   deriving (Eq, Show)

instance Functor ZipList' where
    fmap f (ZipList' xs) = ZipList' $ fmap f xs

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _ = Nil
zipWith' _ _ Nil = Nil
zipWith' f (Cons x xs) (Cons y ys) = Cons (f x y) (zipWith' f xs ys)

instance Applicative ZipList' where
    pure = ZipList' . repeat'
        where repeat' a = Cons a (repeat' a)
    ZipList' fs <*> ZipList' xs = ZipList' $ zipWith' (\f x -> f x) fs xs

instance Arbitrary a => Arbitrary (ZipList' a) where
    arbitrary = ZipList' <$> arbitrary

take' :: Int -> List a -> List a
take' _ Nil = Nil
take' n (Cons a as)
    | n <= 0 = Nil
    | otherwise = Cons a (take' (n - 1) as)

instance Eq a => EqProp (ZipList' a) where
    xs =-= ys = xs' `eq` ys'
        where xs' = let (ZipList' l) = xs
                    in take' 3000 l
              ys' = let (ZipList' l) = ys
                    in take' 3000 l
