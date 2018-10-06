module ParserCombinators.ChapterExercises.IPV6Addresses where

import Control.Applicative
import qualified Data.Map as M
import Data.Char
import Data.Word
import Data.List
import Data.Maybe
import Text.Trifecta
import Test.QuickCheck (Arbitrary, arbitrary)

instance (Eq a) => Eq (Result a) where
    Success a == Success b = a == b
    Failure a == Failure b = True
    _ == _ = False

data IPAddress6 = IPAddress6 Word64 Word64
    deriving (Eq, Ord)

instance Show IPAddress6 where
    show (IPAddress6 x y) = intercalate ":" $ map stripLeadingZeros xy
        where x' = pad 16 '0' $ decimalToHex x
              y' = pad 16 '0' $ decimalToHex y
              xy = separateEvery 4 $ x' ++ y'

instance Arbitrary IPAddress6 where
    arbitrary = liftA2 IPAddress6 arbitrary arbitrary

ipAddress6 :: Parser IPAddress6
ipAddress6 = do
    xs <- sepBy (many (noneOf ":")) (char ':')
    let ys = map (pad 4 '0') $ uncollapse xs
        ys1 = fromIntegral $ hexToDecimal $ concat $ take 4 ys
        ys2 = fromIntegral $ hexToDecimal $ concat $ drop 4 ys
    return $ IPAddress6 ys1 ys2

uncollapse :: [String] -> [String]
uncollapse xs = go xs
    where n = 8 - length (filter (/= "") xs)
          go [] = []
          go (y : ys)
            | y == "" = replicate n "0" ++ ys
            | otherwise = y : go ys

stripLeadingZeros :: String -> String
stripLeadingZeros "" = ""
stripLeadingZeros [x] = [x]
stripLeadingZeros (x:xs)
  | x == '0'    = stripLeadingZeros xs
  | otherwise   = x : xs

pad :: Int -> a -> [a] -> [a]
pad n x xs = replicate (n - length xs) x ++ xs

hexToDecimal :: (Integral a) => String -> a
hexToDecimal = foldl' (\acc x -> acc * 16 + lookup x) 0
    where vocab = M.fromList $ zip "0123456789ABCDEF" [0..15]
          lookup x = fromJust $ M.lookup (toUpper x) vocab

decimalToHex :: (Integral a) => a -> String
decimalToHex n
  | n < 16      = [vocab !! fromIntegral n]
  | otherwise   = decimalToHex (n `div` 16) ++ [vocab !! fromIntegral (n `mod` 16)]
    where vocab = "0123456789ABCDEF"

separateEvery :: Int -> [a] -> [[a]]
separateEvery _ [] = []
separateEvery n xs = take n xs : separateEvery n (drop n xs)
