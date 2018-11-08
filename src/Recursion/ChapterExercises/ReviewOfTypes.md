# Review of Types

1. The type of `[[True, False], [True, True], [False, True]]` is d) `[[Bool]]`.

2. b) `[[3 == 3], [6 > 5], [3 < 4]]` has the same type as `[[True, False], [True, True], [False, True]]`.

3. For the function
```haskell
func :: [a] -> [a] -> [a]
func x y = x ++ y
```
we have
    a) `x` and `y` must be of the same type
    b) `x` and `y` must both be lists
    c) if `x` is a `String` then `y` must be a `String`

4. For the `func` code above, b) `func "Hello" "World"` is a valid application to both of its arguments.
