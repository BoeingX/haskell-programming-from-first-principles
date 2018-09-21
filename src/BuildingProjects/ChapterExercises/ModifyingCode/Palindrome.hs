module BuildingProjects.ChapterExercises.ModifyingCode.Palindrome where

import Control.Monad
import Data.Char
import System.Exit

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    case (line1 == reverse line1) of
        True -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess

palindrome' :: IO ()
palindrome' = forever $ do
    line1 <- getLine
    let line2 = (map toLower . filter isAlpha) line1
    case (line2 == reverse line2) of
        True -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess
