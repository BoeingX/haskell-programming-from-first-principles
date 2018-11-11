# Given a datatype declaration, what can we do?

Given the following datatype definitions:
```haskell
data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)
```

1. `phew = Papu "chases" True` does not typecheck because `"chases"` is not of type `Rocks` and `True` is not of type `Yeah`.

2. `truth = Papu (Rocks "chomskydoz") (Yeah True)` typechecks.

3. The following
```haskell
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
```
typechecks.

4. The following
```haskell
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
```
does not typecheck because `Papu` has no instance of `Ord`.
