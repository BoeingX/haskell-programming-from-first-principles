# Reviewing Currying

Given the following definition
```haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
```
we have
```haskell
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"
```

1. The result of `appedCatty "woohoo!"` is `"woops mrow woohoo!"`.

2. The result of `frappe "1"` is `"1 mrow haha"`.

3. The result of `frappe (appedCatty "2")` is `"woops mrow 2 mrow haha"`.

4. The result of `appedCatty (frappe "blue")` is `"woops mrow blue mrow haha"`.

5. `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))` 
gives `"pink mrow haha mrow green mrow woops mrow blue"`.

6. `cattyConny (flippy "Pugs" "are") "awesome"` gives
`"are mrow Pugs mrow awesome"`.
