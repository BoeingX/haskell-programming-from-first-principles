module MonadTransformers.ChapterExercises.FixTheCode where

import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Class
import Control.Monad

isValid :: String -> Bool
isValid v = '!' `elem` v

maybeExcite :: MaybeT IO String
maybeExcite = do
    -- v :: String because MaybeT IO String is a monad
    --                     |_______| |____|
    --                         m       a
    -- thus v :: a, i.e. v :: String
    v <- (lift :: IO String -> MaybeT IO String) getLine
    guard $ isValid (v :: String)
    return v

doExcite :: IO ()
doExcite = do
    putStrLn "say something excite!"
    -- excite :: Maybe String because (runMaybeT maybeExcite) :: IO (Maybe String)
    --                                                          |__| |___________|
    --                                                            m       a
    excite <- runMaybeT (maybeExcite :: MaybeT IO String)
    case excite of
        Nothing -> putStrLn "MOAR EXCITE"
        Just e -> putStrLn ("Good, was very excite: " ++ e)
