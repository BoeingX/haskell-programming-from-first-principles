module AlgebraicDataTypes.ChapterExercises.HuttonRazorSpec where

import Test.Hspec
import AlgebraicDataTypes.ChapterExercises.HuttonRazor

spec :: Spec
spec = do
    describe "Test eval" $ 
        it "eval (Add (Lit 1) (Lit 9001))" $ do
            eval (Add (Lit 1) (Lit 9001)) `shouldBe` 9002
    describe "Test showExpr" $ do
        it "printExpr (Add (Lit 1) (Lit 9001))" $ do
            printExpr (Add (Lit 1) (Lit 9001)) `shouldBe` "1 + 9001"
        it "printExpr a3" $ do
            let a1 = Add (Lit 9001) (Lit 1)
                a2 = Add a1 (Lit 20001)
                a3 = Add (Lit 1) a2
            printExpr a3 `shouldBe` "1 + 9001 + 1 + 20001"
