module Types.ChapterExercises.FixIt where

-- Question 1
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing :: [Char]
sing = if (x > y) then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"

-- Question 2
main :: IO ()
main = do
    print $ 1 + 2
    putStrLn $ show 10
    print (negate (-1))
    print ((+) 0 blah)
        where blah = negate 1
