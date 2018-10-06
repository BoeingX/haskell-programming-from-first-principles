module ParserCombinators.ChapterExercises.IPV4Addresses where

import Control.Applicative
import Data.Word
import Data.List
import Text.Trifecta
import Test.QuickCheck (Arbitrary, arbitrary)

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

data IPAddress = IPAddress Word32
    deriving (Eq, Ord)

instance Show IPAddress where
    show (IPAddress x) = intercalate "." $ map (show . binToDecimal) x''
        where x' = pad 32 0 $ decimalToBin x
              x'' = separateEvery 8 x'

instance Arbitrary IPAddress where
    arbitrary = IPAddress <$> arbitrary

ipAddress :: Parser IPAddress
ipAddress = IPAddress . fromIntegral . binToDecimal . dotDecimalToBin <$> sepBy integer (char '.')

decimalToBin :: (Integral a) => a -> [a]
decimalToBin n
  | n <= 1      = [n]
  | otherwise   = decimalToBin (n `div` 2) ++ [n `mod` 2]

pad :: Int -> a -> [a] -> [a]
pad n a xs = replicate nPad a ++ xs
    where nPad = max (n - length xs) 0

dotDecimalToBin :: (Integral a) => [a] -> [a]
dotDecimalToBin = concatMap (pad 8 0 . decimalToBin)

binToDecimal :: (Integral a) => [a] -> a
binToDecimal = foldl' (\acc x -> acc * 2 + x) 0

separateEvery :: Int -> [a] -> [[a]]
separateEvery _ [] = []
separateEvery n xs = take n xs : separateEvery n (drop n xs)
