module AlgebraicDataTypes.ChapterExercises.LanguageExercises where

import Data.Char

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (c:cs) = toUpper c : cs

capitalizeParagraph :: String -> String
capitalizeParagraph "" = ""
capitalizeParagraph cs = capitalizeWord p1 ++ punct ++ capitalizeParagraph p2
    where (p1, p2') = span (/= '.') cs
          (punct, p2) = span (`elem` ['.', ' ']) p2'
