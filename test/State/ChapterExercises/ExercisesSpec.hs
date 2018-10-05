module State.ChapterExercises.ExercisesSpec where

import Test.Hspec
import State.ChapterExercises.Exercises

spec :: Spec
spec = do
    describe "Test get" $ do
        it "runState get \"curryIsAmaze\"" $ do
            runState get "curryIsAmaze" `shouldBe` ("curryIsAmaze","curryIsAmaze")
    describe "Test put" $ do
        it "runState (put \"blah\") \"woot\"" $ do
            runState (put "blah") "woot" `shouldBe` ((),"blah")
    describe "Test exec" $ do
        it "exec (put \"wilma\") \"daphne\"" $ do
            exec (put "wilma") "daphne" `shouldBe` "wilma"
        it "exec get \"scooby papu\"" $ do
            exec get "scooby papu" `shouldBe` "scooby papu"
    describe "Test eval" $ do
        it "eval get \"bunnicula\"" $ do
            eval get "bunnicula" `shouldBe` "bunnicula"
        it "eval get \"stake a bunny\"" $ do
            eval get "stake a bunny" `shouldBe` "stake a bunny"
    describe "Test modify" $ do
        it "runState (modify (+1)) 0" $ do
            runState (modify (+1)) 0 `shouldBe` ((),1)
        it "runState (modify (+1) >> modify (+1)) 0" $ do
            runState (modify (+1) >> modify (+1)) 0 `shouldBe` ((),2 :: Int)
