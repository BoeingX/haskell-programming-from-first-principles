## Will this blow up?

1. `[x^y | x <- [1..5], y <- [2, undefined]]` returns the bottom.

2. `take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]` returns `1`.

3. `sum [1, undefined, 3]` returns the bottom.

4. `length [1, 2, undefined]` returns `3`.

5. `length $ [1, 2, 3] ++ undefined` returns the bottom because the bottom is part of the spine.

6. `take 1 $ filter even [1, 2, 3, undefined]` returns `2`.

7. `take 1 $ filter even [1, 3, undefined]` returns the bottom.

8. `take 1 $ filter odd [1, 3, undefined]` returns `1`.

9. `take 2 $ filter odd [1, 3, undefined]` returns `[1,3]`.

10. `take 3 $ filter odd [1, 3, undefined]` returns the bottom.

## Is it in normal form?

1. `[1, 2, 3, 4, 5]` is in NF.

2. `1 : 2 : 3 : 4 : _` is in WHNF.

3. `enumFromTo 1 10` is in neither NF nor WHNF.

4. `length [1, 2, 3, 4, 5]` is in neither NF nor WHNF.

5. `sum (enumFromTo 1 10)` is in neither NF nor WHNF.

6. `['a'..'m'] ++ ['n'..'z']` is in neither NF nor WHNF.

7. `(_, 'b')` is in WHNF.
