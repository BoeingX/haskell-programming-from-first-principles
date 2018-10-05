module State.ChapterExercises.Exercises where

newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where
    fmap f (State g) = State $ \x -> let (a, s) = g x in (f a, s)

instance Applicative (State s) where
    pure a = State $ (,) a
    (State f) <*> (State g) = State $ \s -> let (ab, s') = f s
                                                (a, s'') = g s
                                            in (ab a, s'')

instance Monad (State s) where
    return = pure
    (State f) >>= g = State $ \x -> let (a, s) = f x
                                        State h  = g a
                                    in h s

-- Question 1
get :: State s s
get = State $ \s -> (s, s)

-- Question 2
put :: s -> State s ()
put s = State $ const ((), s)

-- Question 3
exec :: State s a -> s -> s
exec (State sa) = snd . sa

-- Question 4
eval :: State s a -> s -> a
eval (State sa) = fst . sa

-- Question 5
modify :: (s -> s) -> State s ()
modify f = State $ \s -> ((), f s)
