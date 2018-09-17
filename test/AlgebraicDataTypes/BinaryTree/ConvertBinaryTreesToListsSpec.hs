module AlgebraicDataTypes.BinaryTree.ConvertBinaryTreesToListsSpec where

import Test.Hspec
import AlgebraicDataTypes.BinaryTree.ConvertBinaryTreesToLists

spec :: Spec
spec = do
    describe "Test preorder, inorder and postorder" $ do
        let testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)
        it "preorder" $ do
            preorder testTree `shouldBe` [2, 1, 3]
        it "inorder" $ do
            inorder testTree `shouldBe` [1, 2, 3]
        it "postorder" $ do
            postorder testTree `shouldBe` [1, 3, 2]
