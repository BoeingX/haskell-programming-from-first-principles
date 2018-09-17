module AlgebraicDataTypes.ProductTypes.JamminExercisesSpec where

import Test.Hspec
import AlgebraicDataTypes.ProductTypes.JamminExercises

row1, row2, row3, row4, row5, row6 :: JamJars
row1 = Jam Peach 5
row2 = Jam Plum 2
row3 = Jam Apple 1
row4 = Jam Blackberry 7
row5 = Jam Peach 4
row6 = Jam Apple 8

allJams :: [JamJars]
allJams = [row1, row2, row3, row4, row5, row6]


spec :: Spec
spec = do
    describe "Test groupJam" $ do
        it "groupJam" $ do
            groupJam allJams `shouldBe` [[Jam Peach 5, Jam Peach 4], [Jam Plum 2], [Jam Apple 1, Jam Apple 8], [Jam Blackberry 7]]
