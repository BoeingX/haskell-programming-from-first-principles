```haskell
data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a =
    Husky a
  | Mastiff a
  deriving (Eq, Show)
```

1. `Doggies` is a type constructor.

2. The kind of `Doggies` is `* -> *`.

3. The kind of `Doggies String` is `*`.

4. The type of `Husky 10` is `(Num a) => Doggies a`.

5. The type of `Husky (10 :: Integer)` is `Doggies Integer`.

6. The type of `Mastiff "Scooby Doo"` is `Doggies String`.

7. `DogueDeBordeaux` is both a type and data constructor.

8. The type of `DogueDeBordeaux` is `DogueDeBordeaux a`.

9. Type of `DogueDeBordeaux "doggie!"` is `DogueDeBordeaux String`.
