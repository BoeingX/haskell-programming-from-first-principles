module SignalingAdversity.ChapterExercises.IterateAndUnfoldr where

myIterate :: (a -> a) -> a -> [a]
myIterate f a = b : myIterate f b
                    where b = f a

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = case f b of
                    Nothing     -> []
                    Just (x, y) -> x : myUnfoldr f y

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\y -> Just (y, f y))
