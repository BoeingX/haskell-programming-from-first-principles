module SignalingAdversity.ChapterExercises.SomethingOtherThanList where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f a = case f a of
                Nothing -> Leaf
                Just (a', b, a'') -> Node (unfold f a') b (unfold f a'')

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold f 0
    where f m
            | m == n = Nothing
            | otherwise = Just (m + 1, m , m + 1)
