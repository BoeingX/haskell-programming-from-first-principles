# Type inference

1. For `(++) :: [a] -> [a] -> [a]`, we have
```haskell
myConcat :: String -> String
myConcat x = x ++ " yo"
```

2. For `(*) :: Num a => a -> a -> a`, we have
```haskell
myMult :: (Fractional a) => a -> a
myMult x = (x / 3) * 5
```

3. For `take :: Int -> [a] -> [a]`, we have
```haskell
myTake :: Int -> String
myTake x = take x "hey you"
```

4. For `(>) :: Ord a => a -> a -> Bool`, we have
```haskell
myCom :: Int -> Bool
myCom x = x > (length [1..10])
```

5. For `(<) :: Ord a => a -> a -> Bool`, we have
```haskell
myAlph :: Char -> Bool
myAlph x = x < 'z'
```
