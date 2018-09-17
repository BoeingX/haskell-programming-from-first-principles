1. Given
```haskell
data Weekday =
    Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
```
we can say that *a) `Weekday` is a type with five data constructors*.

2. With the same datatype, the type of
```haskell
f Friday = "Miller Time"
```
has the type
```haskell
f :: Weekday -> String
```

3. Type defined with the `data` keyword *b) must begin with a capital letter*.

4. The function `g xs = xs !! (length xs - 1)` *c) delivers the final element of `xs`*.
