module Reader.FunctionsHaveAnApplicativeToo.ExerciseSpec where

import Test.Hspec
import Reader.FunctionsHaveAnApplicativeToo.Exercise

pers :: Person
pers = Person (HumanName "Big Bird")
              (DogName "Barkley")
              (Address "Sesame Street")

chris :: Person
chris = Person (HumanName "Chris Allen")
               (DogName "Papu")
               (Address "Austin")

spec :: Spec
spec = do
    describe "Test getDogR" $ do
        it "Test pers" $ do
            runReader getDogR pers `shouldBe` Dog (DogName "Barkley") (Address "Sesame Street")
        it "Test chris" $ do
            runReader getDogR chris `shouldBe` Dog (DogName "Papu") (Address "Austin")
