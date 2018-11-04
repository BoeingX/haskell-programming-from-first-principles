module BasicLibraries.ChapterExercises.QueueBenchmark (
    benchmarks
) where

import Criterion
import Data.Sequence
import BasicLibraries.ChapterExercises.Queue

listQueueBench :: Int -> [Int]
listQueueBench n = foldr go [] [1..2*n]
    where go x acc
            | even x = x : acc
            | otherwise = init acc

queueBench :: Int -> Queue Int
queueBench n = foldr go initQueue [1..2*n]
    where initQueue = Queue [] []
          go x acc
            | even x = push x acc
            | otherwise = let Just (_, acc') = pop acc in acc'

sequenceBench :: Int -> Seq Int
sequenceBench n = foldr go empty [1..2*n]
    where go x acc
            | even x = x <| acc
            | otherwise = let acc' :> _ = viewr acc in acc'

benchmarks :: [Benchmark]
benchmarks = 
    [ bench "list queue" $ nf listQueueBench 123456
    , bench "queue" $ whnf queueBench 123456
    , bench "sequence" $ whnf sequenceBench 123456
    ]

{- Reference benchmark results

benchmarking Queue/list queue
time                 27.27 ms   (26.40 ms .. 27.86 ms)
                     0.996 R²   (0.991 R² .. 0.999 R²)
mean                 27.70 ms   (27.21 ms .. 28.66 ms)
std dev              1.439 ms   (768.4 μs .. 2.317 ms)
variance introduced by outliers: 16% (moderately inflated)

benchmarking Queue/queue
time                 10.75 ms   (10.51 ms .. 11.01 ms)
                     0.996 R²   (0.993 R² .. 0.998 R²)
mean                 10.98 ms   (10.83 ms .. 11.27 ms)
std dev              545.3 μs   (329.6 μs .. 914.8 μs)
variance introduced by outliers: 23% (moderately inflated)

benchmarking Queue/sequence
time                 7.768 ms   (7.597 ms .. 7.926 ms)
                     0.996 R²   (0.993 R² .. 0.999 R²)
mean                 8.119 ms   (7.932 ms .. 8.509 ms)
std dev              719.3 μs   (393.4 μs .. 1.096 ms)
variance introduced by outliers: 51% (severely inflated)

-}
