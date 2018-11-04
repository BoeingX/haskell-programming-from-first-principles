module BasicLibraries.ChapterExercises.Queue where

-- From Okasaki's Purely Functional Data Structures
data Queue a =
    Queue { enqueue :: [a]
          , dequeue :: [a]
    } deriving (Eq, Show)

-- adds an item
push :: a -> Queue a -> Queue a
push x (Queue [] []) = Queue [] [x]
push x (Queue xs ys) = Queue (x : xs) ys

pop :: Queue a -> Maybe (a, Queue a)
pop (Queue [] []) = Nothing
pop (Queue xs []) = Just (y, Queue [] ys)
    where (y : ys) = reverse xs
pop (Queue xs (y : ys)) = Just (y, Queue xs ys)
