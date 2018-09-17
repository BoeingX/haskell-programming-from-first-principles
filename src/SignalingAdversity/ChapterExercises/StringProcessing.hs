module SignalingAdversity.ChapterExercises.StringProcessing (
    notThe
  , replaceThe
  , countTheBeforeVowel
  , countVowels
) where

-- Question 1
notThe :: String -> Maybe String
notThe s
    | s == "the" = Nothing
    | otherwise  = Just s

replaceThe :: String -> String
replaceThe "" = ""
replaceThe s  = (replace . notThe) firstWord ++ next
                where (firstWord, nextWords) = span (/= ' ') s
                      replace Nothing  = "a"
                      replace (Just s) = s
                      next 
                        | nextWords == "" = ""
                        | otherwise = " " ++ (replaceThe . dropWhile (== ' ')) nextWords

-- Even simpler
replaceThe' :: String -> String
replaceThe' = unwords . map (replaceThe . notThe) . words
                where replaceThe Nothing  = "a"
                      replaceThe (Just s) = s

-- Question 2
isVowel :: Char -> Bool
isVowel = (`elem` "aeiouAEIOU")

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel "" = 0
countTheBeforeVowel s  = (
                         if firstWord == "the" && beginWithVowel otherWordsTrim
                            then 1
                            else 0
                         )
                         + countTheBeforeVowel otherWordsTrim
                        where (firstWord, otherWords) = span (/= ' ') s
                              otherWordsTrim = dropWhile (== ' ') otherWords
                              beginWithVowel "" = False
                              beginWithVowel (x:xs) = isVowel x

-- Question 3
countVowels :: String -> Integer
countVowels = fromIntegral . length . filter isVowel
