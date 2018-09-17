module AlgebraicDataTypes.BinaryTree.WriteFoldrForBinaryTreeSpec where

import Test.Hspec
import AlgebraicDataTypes.BinaryTree.WriteFoldrForBinaryTree

spec :: Spec
spec = do
    describe "Test foldTree" $ do
        it "Test mapTree implemented with foldTree" $ do
            let testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)
            let mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)
            mapTree (+1) testTree `shouldBe` mapExpected
