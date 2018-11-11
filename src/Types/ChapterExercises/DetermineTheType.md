# Determine the type

1. All function applications return a value. Determine the value
returned by these function applications and the type of that
value.
    a) `(* 9) 6 = 54 :: (Num a) => a`.
    b) `head [(0,"doge"),(1,"kitteh")] = (0, "doge") :: (Num a) => (a, String)`
    c) `head [(0 :: Integer ,"doge"),(1,"kitteh")] = (0, "doge") :: (Integer, String)`.
    d) `if False then True else False = False :: Bool`.
    e) `length [1, 2, 3, 4, 5] = 5 :: Int`
    f) `(length [1, 2, 3, 4]) > (length "TACOCAT") = False :: Bool`.

2. Given
```haskell
x = 5
y = x + 5
w = y * 10
```
the type of `w` is `(Num a) => a`.

3. Given
```haskell
x = 5
y = x + 5
z y = y * 10
```
the type of `z` is `(Num a) => a -> a`.
Note that `y` in the definition of `z` **shadows** `y = x + 5`.
Therefore `z` is a function instead of a value.

4. Given
```haskell
x = 5
y = x + 5
f = 4 / y
```
the type of `f` is `(Fractional a) => a`.

5. Given
```haskell
x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
```
the type of `f` is `String`.
