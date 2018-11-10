# Intermission: Exercises

3. The following function
```haskell
pal xs
    | xs == reverse xs = True
    | otherwise = False
```
b) returns `True` when `xs` is a palindrome.

5. `pal :: [a] -> Bool` (or `pal :: (Foldable t) => t a -> Bool`).

6. The following function
```haskell
numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1
```
c) returns an indication of whether its argument is a positive or negative number or zero

8. `numbers :: (Num a, Ord a) => a -> a`
