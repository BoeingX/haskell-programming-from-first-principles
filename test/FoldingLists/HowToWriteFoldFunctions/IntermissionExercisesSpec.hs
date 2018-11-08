module FoldingLists.HowToWriteFoldFunctions.IntermissionExercisesSpec where

import Data.Time
import Test.Hspec

import FoldingLists.HowToWriteFoldFunctions.IntermissionExercises

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
              (fromGregorian 1911 5 1)
              (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
              (fromGregorian 1921 5 1)
              (secondsToDiffTime 34123))
    ]

spec :: Spec
spec = do
    describe "Test filterDbDate" $ do
        it "filterDbDate theDatabase" $ do
            let t1 = UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)
                t2 = UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
            filterDbDate theDatabase `shouldBe` [t1, t2]
    describe "Test filterDbNumber" $ do
        it "filterDbNumber theDatabase" $ do
            filterDbNumber theDatabase `shouldBe` [9001]
    describe "Test mostRecent" $ do
        it "mostRecent theDatabase" $ do
            mostRecent theDatabase `shouldBe` UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
    describe "Test sumDb" $ do
        it "sumDb theDatabase" $ do
            sumDb theDatabase `shouldBe` 9001
    describe "Test avgDb" $ do
        it "avgDb theDatabase" $ do
            avgDb theDatabase `shouldBe` 9001
