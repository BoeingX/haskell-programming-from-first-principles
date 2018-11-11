# Does it typecheck?

1. The following code
```haskell
data Person = Person Bool

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```
does not typecheck because `Person` has no instance of `Show`.

2. The following code
```haskell
data Mood = Blah
          | Woot deriving Show

settleDown x = if x == Woot
                then Blah
                else x
```
does not typecheck because `Mood` has no instance of `Eq`.

3. Suppose that we were able to get `settleDown` to typecheck, then
    a) it accepts `Blah` and `Woot` as input
    b) `settleDown 9` gives an error saying *No instance for (Num Mood) arising from the literal '9'*.
    c) `Blah > Woot` gives an error because `Mood` has no instance of `Ord`.

4. The following code
```haskell
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
```
does typecheck.
