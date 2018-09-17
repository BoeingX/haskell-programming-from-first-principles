module AlgebraicDataTypes.BinaryTree.WriteMapForBinaryTreeSpec where

import Test.Hspec
import AlgebraicDataTypes.BinaryTree.WriteMapForBinaryTree

spec :: Spec
spec = do
    describe "Test mapTree" $ do
        it "(+1)" $ do
            let testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)
            let mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)
            mapTree (+1) testTree `shouldBe` mapExpected
