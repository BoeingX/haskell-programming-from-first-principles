module Lists.ZippingLists.ZippingExercisesSpec where

import Test.Hspec
import Test.QuickCheck
import Lists.ZippingLists.ZippingExercises

spec :: Spec
spec = do
    describe "Test zip'" $ do
        it "behaves the same as zip" $ property $ 
            \x y -> zip' x y == zip (x::[Int]) (y::[Int])
    describe "Test zipWith'" $ do
        it "behaves the same as zipWith" $ property $ 
            \x y -> zipWith' (+) x y == zipWith (+) (x::[Int]) (y::[Int])
    describe "Test zip''" $ do
        it "behaves the same as zip" $ property $ 
            \x y -> zip'' x y == zip (x::[Int]) (y::[Int])
