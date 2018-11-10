# Intermission: Exercises

1. All expressions are equivalent.

2. The type of `mTh 3` is `Num a => a -> a -> a`.

3. We have

```haskell
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

addFive x y = \x y -> (if x > y then y else x) + 5

mflip f x y = f y x
```
