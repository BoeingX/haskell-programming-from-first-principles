module AlgebraicDataTypes.BinaryTree.ConvertBinaryTreesToLists where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node l a r) = a : preorder l ++ preorder r

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node l a r) = inorder l ++ [a] ++ inorder r

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node l a r) = postorder l ++ postorder r ++ [a]
