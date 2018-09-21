module Testing.ChapterExercises.IdempotenceSpec where

import Data.List
import Test.Hspec
import Test.QuickCheck
import Testing.ChapterExercises.Idempotence

f :: String -> Bool
f x = (capitalizeWord x == twice capitalizeWord x)
    && (capitalizeWord x == fourTimes capitalizeWord x)

testCapitalizeWord :: IO ()
testCapitalizeWord = quickCheck f

f' :: [Int] -> Bool
f' x = (sort x == twice sort x) && (sort x == fourTimes sort x)

testSort :: IO ()
testSort = quickCheck f'

spec :: Spec
spec = do
    describe "Check Idempotence" $ do
        it "Check capitalizeWord" $ do
            property $ f
        it "Check sort" $ do
            property $ f'
