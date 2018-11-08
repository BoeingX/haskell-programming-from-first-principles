# Intermission: Exercises

1. `take 1 $ map (+1) [undefined, 2, 3]` returns the bottom.

2. `take 1 $ map (+1) [1, undefined, 3]` returns `2`.

3. `take 2 $ map (+1) [1, undefined, 3]` returns the bottom.

4. `itIsMystery xs = map (\x -> elem x "aeiou") xs` has type `itIsMystery :: String -> [Bool]`
which tells if each character a vowel.

5. We have
    a) `map (^2) [1..10] = [1, 2, 4, ..., 100]`.
    b) `map minimum [[1..10], [10..20], [20..30]] = [1, 10, 20]`.
    c) `map sum [[1..5], [1..5], [1..5]] = [15, 15, 15]`

6. `map (\x -> if x == 3 then (-x) else (x)) [1..10]` could be rewritten as follows
```haskell
import Data.Bool

map (\x -> bool (-x) x (x == 3)) [1..10]
```
