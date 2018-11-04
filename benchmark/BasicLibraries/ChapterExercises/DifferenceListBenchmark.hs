module BasicLibraries.ChapterExercises.DifferenceListBenchmark (
    benchmarks
) where

import Criterion
import BasicLibraries.ChapterExercises.DifferenceList

schlemiel :: Int -> [Int]
schlemiel i = go i []
    where go 0 xs = xs
          go n xs = go (n-1) [n] ++ xs

constructDlist :: Int -> [Int]
constructDlist i = toList $ go i empty
    where go 0 xs = xs
          go n xs = go (n-1) (singleton n `append` xs)

benchmarks :: [Benchmark]
benchmarks = 
    [ bench "concat list" $ whnf schlemiel 123456
    , bench "concat dlist" $ whnf constructDlist 123456
    ]

{- Reference benchmark results

benchmarking Difference List/concat list
time                 35.99 ms   (32.95 ms .. 42.01 ms)
                     0.942 R²   (0.873 R² .. 0.993 R²)
mean                 38.50 ms   (36.79 ms .. 41.26 ms)
std dev              4.482 ms   (3.416 ms .. 5.551 ms)
variance introduced by outliers: 45% (moderately inflated)

benchmarking Difference List/concat dlist
time                 217.9 μs   (211.2 μs .. 225.5 μs)
                     0.990 R²   (0.984 R² .. 0.996 R²)
mean                 217.9 μs   (213.2 μs .. 224.9 μs)
std dev              19.38 μs   (15.17 μs .. 23.67 μs)
variance introduced by outliers: 75% (severely inflated)
-}
