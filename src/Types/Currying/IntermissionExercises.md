# Intermission: Exercises

1. If the type of `f` is `a -> a -> a -> a`,
and the type of `x` is `Char`,
then the type of `f x` is
a) `Char -> Char -> Char`.

2. If the type of `g` is `a -> b -> c -> b`,
then the type of `g 0 'c' "woot"` is d) `Char`.

3. If the type of `h` is `(Num a, Num b) => a -> b -> b`,
then the type of `h 1.0 2` is
d) `Num b => b`.

4. If the type of `h` is `(Num a, Num b) => a -> b -> b`,
then the type of `h 1 (5.5 :: Double)` is
c) `Double`.

5. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a`, then
the type of `jackal "keyboard" "has the word jackal in it"` is
a) `[Char]`.

6. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a`, then
the type of `jackal "keyboard"` is
e) `Eq b => b -> [Char]`.

7. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then
the type of `kessel 1 2` is
d) `(Num a, Ord a) => a`.

8. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then
the type of `kessel 1 (2 :: Integer)` is a) `(Num a, Ord a) => a`.

9. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then
the type of `kessel (1 :: Integer) 2` is c) `Integer`.
