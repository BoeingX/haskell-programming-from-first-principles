module AlgebraicDataTypes.BinaryTree.WriteFoldrForBinaryTree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

foldTree :: (b -> a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b (Node l a r) = f (foldTree f b l) a (foldTree f b r)

{--
First, note that it is impossible to rewrite mapTree with the foldTree given in the book
whose type is

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b

Indeed, the type suggests first converting the tree to a list using either preorder or
inorder or postorder, such as

foldTree f b bt = foldr f b $ inorder bt

After the traversal, the tree structure is lost, 
otherwise it would be possible to reconstruct a binary tree from one of its traversal.
--}

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree f = foldTree (\l a r -> Node l (f a) r) Leaf
