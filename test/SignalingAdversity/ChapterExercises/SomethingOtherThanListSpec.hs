module SignalingAdversity.ChapterExercises.SomethingOtherThanListSpec where

import Test.Hspec
import SignalingAdversity.ChapterExercises.SomethingOtherThanList

spec :: Spec
spec = do
    describe "Test treeBuild" $ do
        it "treeBuild 0" $ do
            treeBuild 0 `shouldBe` Leaf
        it "treeBuild 1" $ do
            treeBuild 1 `shouldBe` Node Leaf 0 Leaf
        it "treeBuild 2" $ do
            treeBuild 2 `shouldBe` Node (Node Leaf 1 Leaf) 0 (Node Leaf 1 Leaf)
        it "treeBuild 3" $ do
            treeBuild 3 `shouldBe` Node (Node (Node Leaf 2 Leaf) 1  (Node Leaf 2 Leaf)) 0  (Node (Node Leaf 2 Leaf) 1  (Node Leaf 2 Leaf))
