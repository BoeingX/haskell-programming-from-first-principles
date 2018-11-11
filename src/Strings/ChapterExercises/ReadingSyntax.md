# Reading syntax

1. For the following lines of code, read the syntax carefully and
decide if they are written correctly.
    a) concat [[1, 2, 3], [4, 5, 6]]
    b) (++) [1, 2, 3] [4, 5, 6]
    c) (++) "hello" " world"
    d) ["hello" ++ " world"]
    e) "hello" !! 4
    f) (!!) "hello" 4
    g) take 4 "lovely"
    h) take 3 "awesome"

2. We have
    a) `concat [[1 * 6], [2 * 6], [3 * 6]] = [6, 12, 18]`
    b) `"rain" ++ drop 2 "elbow" = "rainbow"`
    c) `10 * head [1, 2, 3] = 10`
    d) `(take 3 "Julie") ++ (tail "yes") = "Jules"`
    e) `concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]] = [2,3,5,6,8,9]`
