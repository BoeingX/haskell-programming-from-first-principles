module SignalingAdversity.ChapterExercises.IterateAndUnfoldrSpec where

import Test.Hspec
import SignalingAdversity.ChapterExercises.IterateAndUnfoldr

spec :: Spec
spec = do
    describe "Test betterIterate" $ do
        it "take 10 $ betterIterate (+1) 0" $ do
            (take 10 $ betterIterate (+1) 0) `shouldBe` [0,1,2,3,4,5,6,7,8,9]
