Given a type that has an instance of Applicative, specialize the types of the methods.

1. `[]`
```haskell
pure :: a -> [a]
(<*>) :: [(a -> b)] -> [a] -> [b]
```

2. `IO`
```haskell
pure :: a -> IO a
(<*>) :: IO (a -> b) -> IO a -> IO b
```

3. `(,) a`
```haskell
pure :: a -> (t, a)
(<*>) :: (t, (a -> b)) -> (t, a) -> (t, b)
```

4. `(->) e`
```haskell
pure :: a -> (e -> a)
(<*>) :: (e -> (a -> b)) -> (e -> a) -> (e -> b)
```
