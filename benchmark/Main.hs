module Main where

import Criterion.Main

import qualified BasicLibraries.ChapterExercises.DifferenceListBenchmark
import qualified BasicLibraries.ChapterExercises.QueueBenchmark

main :: IO ()
main = defaultMain
     [
       bgroup "Difference List" BasicLibraries.ChapterExercises.DifferenceListBenchmark.benchmarks
     , bgroup "Queue" BasicLibraries.ChapterExercises.QueueBenchmark.benchmarks
     ]
