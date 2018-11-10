# Multiple Choice

1. A polymorphic function d) may resolve to values of different types, depending on inputs.

2. Two functions named `f` and `g` have types `Char -> String` and
`String -> [String]` respectively.
The composed function `g . f` has the type
b) `Char -> [String]`.

3. A function `f` has the type `Ord a => a -> a -> Bool`
and we apply it to one numeric value,
its type is now d) `(Num a, Ord a) => a -> Bool`.

4. A function with type `(a -> b) -> c` b) is a higher-order function

5. Given the following definition of `f`
```haskell
f :: a -> a
f x = x
```
the type of `f True` is a) `f True :: Bool`.
