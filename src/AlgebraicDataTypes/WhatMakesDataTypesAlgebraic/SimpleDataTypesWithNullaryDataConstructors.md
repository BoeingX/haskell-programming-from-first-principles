```haskell
data Example = MakeExample deriving Show
```

1. The type of data constructor `MakeExample` is `Example`. We cannot query the type of a type constructor.

2. `:info Example` gives
```haskell
data Example = MakeExample
instance [safe] Show Exmaple
```
As we can see, one can tell what typeclass instances are defined for the Example type using `:info` in GHCi.

3. The type of `MakeExample` is still `Example` if a single type
argument added to `MakeExample`.
