module Lists.ChapterExercises.WritingYourOwnStandardFunctionsSpec where

import Test.Hspec
import Lists.ChapterExercises.WritingYourOwnStandardFunctions

spec :: Spec
spec = do
    describe "Test myAny" $ do
        it "myAny even [1, 3, 5]" $ do
            myAny even [1, 3, 5] `shouldBe` False
        it "myAny odd [1, 3, 5]" $ do
            myAny odd [1, 3, 5] `shouldBe` True 
    describe "Test myElem" $ do
        it "myElem 1 [1..10]" $ do
            myElem 1 [1..10] `shouldBe` True
        it "myElem 1 [2..10]" $ do
            myElem 1 [2..10] `shouldBe` False
    describe "Test myReverse" $ do
        it "myReverse \"blah\"" $ do
            myReverse "blah" `shouldBe` "halb"
        it "myReverse [1..5]" $ do
            myReverse [1..5] `shouldBe` [5, 4, 3, 2, 1]
    describe "Test squishMap" $ do
        it "squishMap (\\x -> [1, x, 3]) [2]" $ do
            squishMap (\x -> [1, x, 3]) [2] `shouldBe` [1,2,3]
        it "squishMap (\\x -> \"WO \"++[x]++\" HOO \") \"123\"" $ do
            squishMap (\x -> "WO "++[x]++" HOO ") "123" `shouldBe` "WO 1 HOO WO 2 HOO WO 3 HOO "
    describe "Test myMaximumBy" $ do
        it "myMaximumBy (\\_ _ -> GT) [1..10]" $ do
            myMaximumBy (\_ _ -> GT) [1..10] `shouldBe` 1
        it "myMaximumBy (\\_ _ -> LT) [1..10]" $ do
            myMaximumBy (\_ _ -> LT) [1..10] `shouldBe` 10
        it "myMaximumBy compare [1..10]" $ do
            myMaximumBy compare [1..10] `shouldBe` 10
    describe "Test myMinimumBy" $ do
        it "myMinimumBy (\\_ _ -> GT) [1..10]" $ do
            myMinimumBy (\_ _ -> GT) [1..10] `shouldBe` 10
        it "myMinimumBy (\\_ _ -> LT) [1..10]" $ do
            myMinimumBy (\_ _ -> LT) [1..10] `shouldBe` 1
        it "myMinimumBy compare [1..10]" $ do
            myMinimumBy compare [1..10] `shouldBe` 1
