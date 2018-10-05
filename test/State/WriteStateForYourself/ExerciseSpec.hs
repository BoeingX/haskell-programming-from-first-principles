module State.WriteStateForYourself.ExerciseSpec where

import Test.Hspec
import State.WriteStateForYourself.Exercise

spec :: Spec
spec = do
    describe "Test Functor implementation" $ do
        it "runMoi ((+1) <$> (Moi $ \\s -> (0, s))) 0" $ do
            runMoi ((+1) <$> (Moi $ \s -> (0, s))) 0 `shouldBe` (1, 0)
