# Intermission: Exercises

1. In the following code
```haskell
Prelude> let x = 5
Prelude> let y = 7
Prelude> let z = x * y
```
`y` is in scope for `z`.

2. In the following code
```haskell
Prelude> let f = 3
Prelude> let g = 6 * f + h
```
`h` is not in scope of `g`.

3. In the following code
```haskell
area d = pi * (r * r)
r = d / 2
```
everything is in scope for executing `area`.

4. In
```haskell
area d = pi * (r * r)
    where r = d / 2
```
`r` and `d` are in scope for `area`.
