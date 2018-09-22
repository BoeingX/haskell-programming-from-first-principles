module Monad.ChapterExercises.RewriteFunctionsSpec where

import Test.Hspec
import Monad.ChapterExercises.RewriteFunctions

spec :: Spec
spec = do
    describe "Test j" $ do
        it "j [[1, 2], [], [3]]" $ do
            j [[1, 2], [], [3]] `shouldBe` [1, 2, 3]
        it "j (Just (Just 1))" $ do
            j (Just (Just 1)) `shouldBe` Just 1
        it "j (Just Nothing)" $ do
            j (Just Nothing) `shouldBe` (Nothing :: Maybe Integer)
        it "j Nothing" $ do
            j Nothing `shouldBe` (Nothing :: Maybe Integer)
