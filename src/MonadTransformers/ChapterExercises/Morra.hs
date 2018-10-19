module MonadTransformers.ChapterExercises.Morra where

import Control.Monad
import Control.Monad.Trans.State
import System.Exit
import System.Random

data GameState = GameState {
                             score1 :: Int
                           , score2 :: Int
                           , trigram :: [Int]
                           }
    deriving (Eq, Show)

gameOver :: GameState -> IO ()
gameOver (GameState s1 s2 _)
  | s1 < 3 && s2 < 3 = return ()
  | otherwise = do
      putStrLn "- Game over"
      putStrLn $ "- Player got " ++ show s1 ++ " points"
      putStrLn $ "- Computer got " ++ show s2 ++ " points"
      if s1 == 3 then
        putStrLn "- Player wins the game"
      else
        putStrLn "- Computer wins the game"
      exitSuccess

makeMove :: GameState -> IO Int
makeMove s = do
    let t = trigram s
        c1 = length $ filter (==1) t
        c2 = length $ filter (==2) t
    case compare c1 c2 of
      GT -> return 1
      LT -> return 2
      EQ -> randomRIO (1, 2)

updateTrigram :: Int -> [Int] -> [Int]
updateTrigram x xs = take 3 (x : xs)

game :: StateT GameState IO Int
game = forever $ StateT $ \s -> do
    p1 <- (read <$> getLine) :: IO Int
    putStrLn $ "P: " ++ show p1
    p2 <- makeMove s
    putStrLn $ "C: " ++ show p2
    let p = p1 + p2
    if odd p then
      putStrLn "- P wins"
    else
      putStrLn "- C wins"
    let (s1, s2) = if odd p then
                            (score1 s +1, score2 s)
                            else
                            (score1 s, score2 s + 1)
        t = updateTrigram p1 $ trigram s
        newGameState = GameState s1 s2 t
    gameOver newGameState
    return (p, newGameState)

main :: IO ()
main = do
    putStrLn "-- p is Player"
    putStrLn "-- c is Computer"
    putStrLn "-- Player is odds, computer is evens."
    (a, s) <- runStateT game (GameState 0 0 [])
    return ()
