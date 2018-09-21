module Testing.ChapterExercises.MakeAGenRandomGeneratorForTheDataType where

import Test.QuickCheck

data Fool = Fulse
          | Frue
          deriving (Eq, Show)

-- Question 1
genFool :: Gen Fool
genFool = elements [Fulse, Frue]

-- Question 2
genFool' :: Gen Fool
genFool' = elements [Fulse, Fulse, Frue]
