# Intermission: Exercises

Given the following datatype
```haskell
data Mood = Blah | Woot deriving Show
```

1. The type constructor is `Mood`.

2. If the function requires a `Mood` value,
we could use `Blah` and `Woot`.

3. `changeMood :: Mood -> Woot` does not type check because
`Woot` is a data constructor, not a type constructor.

4. We have
```haskell
changeMood Blah = Woot
changeMood _    = Blah
```
