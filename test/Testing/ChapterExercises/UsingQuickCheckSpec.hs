module Testing.ChapterExercises.UsingQuickCheckSpec where

import Data.List
import Test.Hspec
import Test.QuickCheck
import Testing.ChapterExercises.UsingQuickCheck

halfIdentity :: Double -> Double
halfIdentity = (*2) . half

prop_halfIdentity :: Double -> Bool
prop_halfIdentity x = halfIdentity x == x

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
                where go _ status@(_, False) = status
                      go y (Nothing, t) = (Just y, t)
                      go y (Just x, t) = (Just y, x >= y)

plusAssociative :: (Num a, Eq a) => a -> a -> a -> Bool
plusAssociative x y z = x + (y + z) == (x + y) + z

plusCommutative :: (Num a, Eq a) => a -> a -> Bool
plusCommutative x y = x + y == y + x

multiplyAssociative :: (Num a, Eq a) => a -> a -> a -> Bool
multiplyAssociative x y z = x * (y * z) == (x * y) * z

multiplyCommutative :: (Num a, Eq a) => a -> a -> Bool
multiplyCommutative x y = x * y == y * x

powerAssociative :: (Integral a, Eq a) => a -> a -> a -> Bool
powerAssociative x y z = x ^ (y ^ z) == (x ^ y) ^ z

powerCommutative :: (Integral a, Eq a) => a -> a -> Bool
powerCommutative x y = x ^ y == y ^ x

spec :: Spec
spec = do
    describe "Test various properties" $ do
        it "Check half" $ do
            property $ prop_halfIdentity
        it "Check sort" $ do
            property $ (listOrdered . sort :: [Int] -> Bool)
        it "Check plus associativity" $ do
            property $ (plusAssociative :: Int -> Int -> Int -> Bool)
        it "Check plus commutativity" $ do
            property $ (plusCommutative :: Int -> Int -> Bool)
        it "Check multiply associativity" $ do
            property $ (multiplyAssociative :: Int -> Int -> Int -> Bool)
        it "Check multiply commutativity" $ do
            property $ (multiplyCommutative :: Int -> Int -> Bool)
        -- it "Check quoteRem" $ do
        --     property $ (\x y -> (quot x y)*y + (rem x y) == (x :: Int))
        -- it "Check divMod" $ do
        --     property $ (\x y -> (div x y)*y + (mod x y) == (x :: Int))
        -- it "Check reverse" $ do
        --     property $ (\x -> (reverse . reverse) x == (x :: [Int]))
        -- it "Check power associativity" $ do
        --     property $ (powerAssociative :: Int -> Int -> Int -> Bool)
        -- it "Check power commutativity" $ do
        --     property $ (powerCommutative :: Int -> Int -> Bool)
        -- it "Check take n" $ do
        --     property $ \n xs -> length (take n (xs :: [Int])) == n
        it "Check read show" $ do
            property $ \x -> (read (show x)) == (x :: Integer)
