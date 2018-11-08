module Lists.FilteringListsOfValues.IntermissionExercisesSpec where

import Test.Hspec
import Lists.FilteringListsOfValues.IntermissionExercises

spec :: Spec
spec = do
    describe "Test multiplesOfThree" $ do
        it "multiplesOfThree [1..10]" $ do
            multiplesOfThree [1..10] `shouldBe` [3, 6, 9]
    describe "Test howManyMultiplesOfThree" $ do
        it "howManyMultiplesOfThree [1..10]" $ do
            howManyMultiplesOfThree [1..10] `shouldBe` 3
    describe "Test removeArticles" $ do
        it "removeArticles \"the brown dog was a goof\"" $ do
            removeArticles "the brown dog was a goof" `shouldBe` ["brown","dog","was","goof"]
