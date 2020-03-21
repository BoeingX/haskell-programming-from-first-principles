## Question 1

`foldr (*) 1 [1..5]` will return the same result as
`b) foldl (flip (*)) 1 [1..5]` and
`c) foldl (*) 1 [1..5]`.

## Question 2

```haskell
foldl (flip (*)) 1 [1..3]
flip (*) (flip (*) (flip (*) 1 1) 2) 3
flip (*) (flip (*) (1 * 1) 2) 3
flip (*) (flip (*) 1 2) 3
flip (*) (2 * 1) 3
flip (*) 2 3
3 * 2
6
```

## Question 3

One difference between `foldr` and `foldl` is
`c) foldr , but not foldl , associates to the right`.

## Question 4

Folds are catamorphisms,
which means they are generally used to
`a) reduce structure`.

## Question 5

``` Haskell
a) foldr (++) "" ["woot", "WOOT", "woot"]
b) foldr max 'a' "fear is the little death"
c) foldr (&&) True [False, True]
d) foldr (||) False [False, True]
e) foldl (\acc x -> acc ++ show x) "" [1..5]
f) foldl const 'a' [1..5]
g) foldl const 0 "tacos"
h) foldr (flip const) 0 "burritos"
i) foldr (flip const) 'z' [1..5]
```
