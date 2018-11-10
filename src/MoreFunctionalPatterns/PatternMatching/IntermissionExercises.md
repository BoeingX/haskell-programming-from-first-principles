# Intermission: Exercises

1. Given the following declarations
```haskell
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)
```
    a) `k :: (a, b) -> a`.
    b) `k2 :: String`, which is different from `k1 :: Num a => a` and `k3 :: Num a => a`.
    c) `k1` and `k3` returns `3` as result.

2. We have
```haskell
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
```
