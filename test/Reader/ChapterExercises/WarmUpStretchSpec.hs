module Reader.ChapterExercises.WarmUpStretchSpec where

import Test.Hspec
import Reader.ChapterExercises.WarmUpStretch

spec :: Spec
spec = do
    describe "Test lookup'" $ do
        it "xs should be Just 6" $ do
            xs `shouldBe` Just 6
        it "ys should be Just 9" $ do
            ys `shouldBe` Just 9
        it "zs should be Nothing" $ do
            zs `shouldBe` Nothing
    describe "Test Maybe Applicative" $ do
        it "x1 should be Just (6, 9)" $ do
            x1 `shouldBe` Just (6, 9)
        it "x2 shouldBe Nothing" $ do
            x2 `shouldBe` Nothing
        it "x3 3 shouldBe (Just 9, Just 9)" $ do
            x3 3 `shouldBe` (Just 9, Just 9)
    describe "Test helper functions" $ do
        it "fromMaybe' 0 xs shouldBe 6" $ do
            fromMaybe' 0 xs `shouldBe` 6
        it "fromMaybe' 0 zs shouldBe 0" $ do
            fromMaybe' 0 zs `shouldBe` 0
    describe "Test main" $ do
        it "sequenceA [Just 3, Just 2, Just 1]" $ do
            sequenceA [Just 3, Just 2, Just 1] `shouldBe` Just [3,2,1]
        it "sequenceA [x, y]" $ do
            sequenceA [x, y] `shouldBe` [[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6]]
        it "sequenceA [xs, ys]" $ do
            sequenceA [xs, ys] `shouldBe` Just [6,9]
        it "summed <$> ((,) <$> xs <*> ys)" $ do
            summed <$> ((,) <$> xs <*> ys) `shouldBe` Just 15
        it "fmap summed ((,) <$> xs <*> zs)" $ do
            fmap summed ((,) <$> xs <*> zs) `shouldBe` Nothing
        it "bolt 7" $ do
            bolt 7 `shouldBe` True
        it "fmap bolt z" $ do
            fmap bolt z `shouldBe` [True,False,False]
        it "sequenceA [(>3), (<8), even] 7" $ do
            sequenceA [(>3), (<8), even] 7 `shouldBe` [True, True, False]
    describe "More tests" $ do
        it "fold (&&) (sequA 7)" $ do
            foldr (&&) True (sequA 7) `shouldBe` False
        it "(sequA . fromMaybe' 0) s'" $ do
            (sequA . fromMaybe' 0) s' `shouldBe` [True, False, False]
        it "(bolt . fromMaybe' 0) ys" $ do
            (bolt . fromMaybe' 0) ys `shouldBe` False
