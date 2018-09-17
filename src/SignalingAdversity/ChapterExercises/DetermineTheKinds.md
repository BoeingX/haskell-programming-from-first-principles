1. Given
```haskell
id :: a -> a
id = undefined
```
the kind of `a` is `*`.

2. Given
```haskell
r :: a -> f a
r = undefined
```
the kind of `a` is `*` and that of `f` is `* -> *`.
