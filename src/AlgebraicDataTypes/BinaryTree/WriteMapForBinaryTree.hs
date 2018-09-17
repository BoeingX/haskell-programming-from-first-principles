module AlgebraicDataTypes.BinaryTree.WriteMapForBinaryTree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node l a r) = Node (mapTree f l) (f a) (mapTree f r)
