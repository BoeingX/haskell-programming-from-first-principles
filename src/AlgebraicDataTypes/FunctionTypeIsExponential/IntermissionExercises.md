Determine how many unique inhabitants each type has.

1. 
```haskell
data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)
```

`eQuad :: Either Quad Quad` can take 8 forms (4 + 4).

2. `prodQuad :: (Quad, Quad)` can take 16 forms (4*4).

3. `funcQuad :: Quad -> Quad` can take 256 forms (4^4).

4. `prodTBool :: (Bool, Bool, Bool)` can take 8 forms (2*2*2).

5. `gTwo :: Bool -> Bool -> Bool` can take 16 forms ((2^2)^2).

6. `fTwo :: Bool -> Quad -> Quad` can take 65536 forms ((2^4)^4).
