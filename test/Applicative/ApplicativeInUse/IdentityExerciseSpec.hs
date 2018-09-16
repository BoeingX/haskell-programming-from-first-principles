module Applicative.ApplicativeInUse.IdentityExerciseSpec where

import Test.Hspec
import Applicative.ApplicativeInUse.IdentityExercise

spec :: Spec
spec = do
    describe "Test Identity" $ do
        it "const <$> Identity [1, 2, 3] <*> Identity [9, 9, 9]" $ do
            const <$> Identity [1, 2, 3] <*> Identity [9, 9, 9] `shouldBe` Identity [1, 2, 3]
