1. Given a datatype
```haskell
data BigSmall = Big Bool
              | Small Bool
              deriving (Eq, Show)
```
the cardinality of this data type is 4.

2. Given a datatype
```haskell
-- needed to have Int8 in scope
import Data.Int
data NumberOrBool = Numba Int8
                  | BoolyBool Bool
                  deriving (Eq, Show)

-- Example use of Numba, parentheses due to
-- syntactic collision between (-) minus and
-- the negate function
let myNumba = Numba (-128)
```
The cardinality of `NumberOrBool` is 258.
