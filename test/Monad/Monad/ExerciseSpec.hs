module Monad.Monad.ExerciseSpec where
    
import Test.Hspec
import Monad.Monad.Exercise

spec :: Spec
spec = do
    describe "Test bind" $ do
        it "bind" $ do
            let f n
                    | n >= 0 = Just n
                    | otherwise = Nothing
            bind f (Just 1) `shouldBe` Just 1
            bind f (Just (-2)) `shouldBe` Nothing
            bind f Nothing `shouldBe` Nothing
