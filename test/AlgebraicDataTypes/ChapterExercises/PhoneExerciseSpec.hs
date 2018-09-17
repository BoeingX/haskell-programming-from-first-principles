module AlgebraicDataTypes.ChapterExercises.PhoneExerciseSpec where

import Test.Hspec
import AlgebraicDataTypes.ChapterExercises.PhoneExercise

daPhone :: DaPhone
daPhone = DaPhone [
    Button '1' "1",
    Button '2' "abc2",
    Button '3' "def3",
    Button '4' "ghi4",
    Button '5' "jkl5",
    Button '6' "mno6",
    Button '7' "pqrs7",
    Button '8' "tuv8",
    Button '9' "wxyz9",
    Button '*' "^*",
    Button '0' "+ 0",
    Button '#' ".,#"
    ]

convo :: [String]
convo =
    ["Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol lol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Haha thanks just making sure rofl ur turn"]

spec :: Spec
spec = do
    describe "Test reverseTaps" $ do
        it "reverseTaps daPhone 'a'" $ do
            reverseTaps daPhone 'a' `shouldBe` [('2', 1)]
        it "reverseTaps 'A'" $ do
            reverseTaps daPhone 'A' `shouldBe` [('*', 1), ('2', 1)]
        it "reverseTaps '7'" $ do
            reverseTaps daPhone '7' `shouldBe` [('7', 5)]
        it "reverseTaps '1'" $ do
            reverseTaps daPhone '1' `shouldBe` [('1', 1)]
        it "reverseTaps 'z'" $ do
            reverseTaps daPhone 'Z' `shouldBe` [('*', 1), ('9', 4)]
        it "reverseTaps ' '" $ do
            reverseTaps daPhone ' ' `shouldBe` [('0', 2)]
