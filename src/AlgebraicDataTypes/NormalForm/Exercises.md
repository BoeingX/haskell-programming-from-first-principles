```haskell
data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show

type Gardener = String

data Garden = Garden Gardener FlowerType
            deriving Show
```
The normal form of `Garden` is
```haskell
data Garden = GardenG Gardener Gardenia
            | GardenD Gardener Daisy
            | GardenR Gardener Rose
            | GardenL Gardener Lilac
```
