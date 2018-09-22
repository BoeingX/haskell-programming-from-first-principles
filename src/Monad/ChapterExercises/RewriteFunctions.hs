module Monad.ChapterExercises.RewriteFunctions where

-- Question 1
j :: Monad m => m (m a) -> m a
j m = m >>= id
-- or even j = join

-- Question 2
l1 :: Monad m => (a -> b) -> m a -> m b
l1 = fmap

-- Question 3
l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 f a b = f <$> a <*> b
-- or even l2 = liftA2

-- Question 4
a :: Monad m => m a -> m (a -> b) -> m b
a = flip (<*>)

-- Question 5
meh :: Monad m => [a] -> (a -> m b) -> m [b]
meh [] _ = return []
meh (x:xs) f = (:) <$> (f x) <*> (meh xs f)

-- Question 6
flipType :: (Monad m) => [m a] -> m [a]
flipType = flip meh id
