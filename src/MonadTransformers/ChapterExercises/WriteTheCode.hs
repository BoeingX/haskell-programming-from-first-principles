module MonadTransformers.ChapterExercises.WriteTheCode where

import Control.Monad.Trans.Reader
import Control.Monad.Trans.State
import Data.Functor.Identity

-- Question 1
rDec :: Num a => Reader a a
rDec = ReaderT $ \r -> Identity (r - 1)

-- Question 2
rDec' :: Num a => Reader a a
rDec' = ReaderT $ fmap Identity ((-1) + )

-- Question 3
rShow :: Show a => ReaderT a Identity String
rShow = ReaderT $ \a -> Identity (show a)

-- Question 4
rShow' :: Show a => ReaderT a Identity String
rShow' = ReaderT (fmap Identity show)

-- Question 5
rPrintAndInc :: (Num a, Show a) => ReaderT a IO a
rPrintAndInc = ReaderT $ \r -> do
                            putStrLn $ "Hi: " ++ show r
                            return $ r + 1

-- Question 6
sPrintIncAccum :: (Num a, Show a) => StateT a IO String
sPrintIncAccum = StateT $ \s -> do
                            putStrLn $ "Hi: " ++ show s
                            return (show s, s + 1)
