module Lists.ExtractingPortionsOfLists.IntermissionExercisesSpec where

import Test.Hspec
import Lists.ExtractingPortionsOfLists.IntermissionExercises

spec :: Spec
spec = do
    describe "Test myWords" $ do
        it "myWords \"all i wanna do is have some fun\"" $ do
            myWords "all i wanna do is have some fun" `shouldBe` ["all","i","wanna","do","is","have","some","fun"]
        it "myWords \"   \"" $ do
            myWords "   " `shouldBe` []
        it "myWords \"  Hello   world \"" $ do
            myWords "  Hello   world " `shouldBe` ["Hello", "world"]
    describe "Test myLines" $ do
        it "myLines \"a\nb c\nd\"" $ do
            myLines "a\nb c\nd" `shouldBe` ["a", "b c", "d"]
        it "myLines sentences" $ do
            let firstSen = "Tyger Tyger, burning bright\n"
                secondSen = "In the forests of the night\n"
                thirdSen = "What immortal hand or eye\n"
                fourthSen = "Could frame thy fearful symmetry?"
                sentences = firstSen ++ secondSen
                            ++ thirdSen ++ fourthSen
                shouldEqual =
                            [ "Tyger Tyger, burning bright"
                            , "In the forests of the night"
                            , "What immortal hand or eye"
                            , "Could frame thy fearful symmetry?"
                            ]
            myLines sentences `shouldBe` shouldEqual
