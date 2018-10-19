module MonadTransformers.ChapterExercises.WriteTheCodeSpec where

import Test.Hspec
import Test.QuickCheck
import Control.Monad.Trans.Reader
import Control.Monad.Trans.State
import MonadTransformers.ChapterExercises.WriteTheCode

spec :: Spec
spec = do
    describe "Test rDec" $ do
        it "runReader rDec 1" $ do
            runReader rDec 1 `shouldBe` 0
        it "fmap (runReader rDec) [1..10]" $ do
            fmap (runReader rDec) [1..10] `shouldBe` [0,1,2,3,4,5,6,7,8,9]
        it "is equivalent to rDec'" $ property $
            \x -> runReader rDec x == runReader rDec' (x :: Int)
    describe "Test rShow" $ do
        it "runReader rShow 1" $ do
            runReader rShow 1 `shouldBe` "1"
        it "fmap (runReader rShow) [1..10]" $ do
            fmap (runReader rShow) [1..10] `shouldBe` ["1","2","3","4","5","6","7","8","9","10"]
        it "is equivalent to rShow'" $ property $
            \x -> runReader rShow x == runReader rShow' (x :: Int)
    describe "Test rPrintAndInc" $ do
        it "runReaderT rPrintAndInc 1" $ do
            a <- runReaderT rPrintAndInc 1
            a `shouldBe` 2
        it "traverse (runReaderT rPrintAndInc) [1..10]" $ do
            a <- traverse (runReaderT rPrintAndInc) [1..10]
            a `shouldBe` [2,3,4,5,6,7,8,9,10,11]
    describe "Test sPrintIncAccum" $ do
        it "runStateT sPrintIncAccum 10" $ do
            a <- runStateT sPrintIncAccum 10
            a `shouldBe` ("10", 11)
        it "mapM (runStateT sPrintIncAccum) [1..5]" $ do
            a <- mapM (runStateT sPrintIncAccum) [1..5]
            a `shouldBe` [("1",2),("2",3),("3",4),("4",5),("5",6)]
