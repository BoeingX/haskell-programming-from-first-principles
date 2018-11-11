# Match the types

1. For the following definition
```haskell
i :: Num a => a
i = 1
```
we cannot replace the type signature with `i :: a`.
Indeed, `i :: a` means that `i` could be resolved as **any** type,
it is clearly impossible to resolve `1` as `String`.

2. In
```haskell
f :: Float
f = 1.0
```
we cannot replace the type signature by `f :: Num a => a`.
Again, `f :: Num a => a` means `f` could be **any** type which
has instance of `Num`.
`1.0` clearly cannot be a `Integer`.
Instead, `f :: (Fractional a) => a` **typechecks**
(which answers the question 3).

4. In
```haskell
f :: Float
f = 1.0
```
we can replace the type signature by `f :: (RealFrac a) => a`.
5. In 
```haskell
freud :: a -> a
freud x = x
```
we can replace the type signature by `freud :: Ord a => a -> a`.

6. In
```haskell
freud' :: a -> a
freud' x = x
```
we can replace the type signature by `freud' :: Int -> Int`.

7. In
```haskell
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
```
we **cannot** write `sigmund :: a -> a` because `myX :: Int` could
**not** be resolved as for example `String`.
Similarly, `sigmund :: (Num a) => a -> a` does **not** typecheck
(which answers the question 8).

9. In
```haskell
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
```
we can write `jung :: [Int] -> Int`.

10. In
```haskell
young :: [Char] -> Char
young xs = head (sort xs)
```
we can write `young :: Ord a => [a] -> a`.

11. In
```haskell
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)
```
we cannot write `signifier :: Ord a => [a] -> a` because `mySort` expects `[Char]` and returns `[Char]`.
