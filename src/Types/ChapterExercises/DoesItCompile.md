# Does it compile?

1. The following
```haskell
bigNum = (^) 5 $ 10
wahoo = bigNum $ 10
```
does not compile because `bigNum` is fully evaluated and takes
no more argument.
The following compiles
```haskell
bigNum = (^) 5
wahoo = bigNum 10
```

2. The following
```haskell
x = print
y = print "woohoo!"
z = x "hello world"
```
compiles.

3. The following
```haskell
a = (+)
b = 5
c = b 10
d = c 200
```
does not compile because `b` takes no argument, neither does `c`.
The following instead compiles
```haskell
a = (+)
b = 5
c = a 10
d = c 200
```

4. The following
```haskell
a = 12 + b
b = 10000 * c
```
does not compile because `b` and `c` are not defined.
The following instead compiles
```haskell
a b = 12 + b
b c = 10000 * c
```
