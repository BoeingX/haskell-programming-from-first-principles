module Lists.ChapterExercises.CiphersSpec where

import Test.Hspec
import Test.QuickCheck
import Lists.ChapterExercises.Ciphers

spec :: Spec
spec = do
    describe "Test caesar" $ do
            it "should be the inverse of unCaesar" $ property $ 
                \x y -> (unCaesar x . caesar x) y == y
