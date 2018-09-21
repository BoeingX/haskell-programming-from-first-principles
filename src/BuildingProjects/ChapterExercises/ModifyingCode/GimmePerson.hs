module BuildingProjects.ChapterExercises.ModifyingCode.GimmePerson where

import System.IO

type Name = String
type Age = Integer
data Person = Person Name Age deriving Show
data PersonInvalid = NameEmpty
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
    | name /= "" && age > 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | not (age > 0) = Left AgeTooLow
    | otherwise = Left $ PersonInvalidUnknown $
                         "Name was: " ++ show name ++
                         " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
    hSetBuffering stdout NoBuffering
    putStr "Please input your name: "
    name <- getLine
    putStr "Please input your age: "
    age  <- getLine
    let person = mkPerson name (read age :: Age)
    case person of
        Left NameEmpty -> putStrLn "Name empty!"
        Left AgeTooLow -> putStrLn "Age too low!"
        Left (PersonInvalidUnknown s) -> putStrLn s
        _ -> putStrLn $ "Yay! Successfully got a person: " ++ show person
