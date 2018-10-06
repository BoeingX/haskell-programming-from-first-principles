module ParserCombinators.ChapterExercises.SemanticVersionsSpec where

import Test.Hspec
import Text.Trifecta
import ParserCombinators.ChapterExercises.SemanticVersions

spec :: Spec
spec = do
    describe "Test parseInteger" $ do
        it "parseString parseInteger mempty \"1\"" $ do
            parseString parseInteger mempty "1" `shouldBe` Success 1
        it "parseString parseInteger mempty \"123\"" $ do
            parseString parseInteger mempty "123" `shouldBe` Success 123
        it "parseString parseInteger mempty \"+1\"" $ do
            parseString parseInteger mempty "+1" `shouldBe` Failure undefined
        it "parseString parseInteger mempty \"01\"" $ do
            parseString parseInteger mempty "01" `shouldBe` Failure undefined
        it "parseString parseInteger mempty \"0\"" $ do
            parseString parseInteger mempty "0" `shouldBe` Success 0
    describe "Test parseSemVer" $ do
        it "parseString parseSemVer mempty \"2.1.1\"" $ do
            parseString parseSemVer mempty "2.1.1" `shouldBe` Success (SemVer 2 1 1 [] [])
        it "parseString parseSemVer mempty \"1.0.0-x.7.z.92\"" $ do
            parseString parseSemVer mempty "1.0.0-x.7.z.92" `shouldBe`Success (SemVer 1 0 0 [NOSS "x", NOSI 7, NOSS "z", NOSI 92] []) 
        it "parseString parseSemVer mempty \"1.0.0-x.7.z.92+alpha.6\"" $ do
            parseString parseSemVer mempty "1.0.0-x.7.z.92+alpha.6" `shouldBe`Success (SemVer 1 0 0 [NOSS "x", NOSI 7, NOSS "z", NOSI 92] [NOSS "alpha", NOSI 6]) 
        it "parseString parseSemVer mempty \"1.0.0+alpha.6\"" $ do
            parseString parseSemVer mempty "1.0.0+alpha.6" `shouldBe`Success (SemVer 1 0 0 [] [NOSS "alpha", NOSI 6]) 
        it "parseString parseSemVer mempty \"1.0.0+7.alpha.6\"" $ do
            parseString parseSemVer mempty "1.0.0+7.alpha.6" `shouldBe`Success (SemVer 1 0 0 [] [NOSI 7, NOSS "alpha", NOSI 6]) 
        it "parseString parseSemVer mempty \"1.0.0-beta+exp.sha.511\"" $ do
            parseString parseSemVer mempty "1.0.0-beta+exp.sha.511" `shouldBe` Success (SemVer 1 0 0 [NOSS "beta"] [NOSS "exp", NOSS "sha", NOSI 511]) 
        it "parseString parseSemVer mempty \"1.0.0+beta+exp.sha.511\"" $ do
            parseString parseSemVer mempty "1.0.0+beta+exp.sha.511" `shouldBe` Failure undefined
    describe "Test Ord instance" $ do
        it "SemVer 2 1 1 [] [] > SemVer 2 1 0 [] []" $ do
            SemVer 2 1 1 [] [] > SemVer 2 1 0 [] [] `shouldBe` True
        it "SemVer 2 1 1 [] [] > SemVer 2 1 1 [NOSS \"alpha\"] []" $ do
            SemVer 2 1 1 [] [] > SemVer 2 1 1 [NOSS "alpha"] [] `shouldBe` True
        it "SemVer 2 1 1 [NOSS \"beta\"] [] > SemVer 2 1 1 [NOSS \"alpha\"] []" $ do
            SemVer 2 1 1 [NOSS "beta"] [] > SemVer 2 1 1 [NOSS "alpha"] [] `shouldBe` True
        it "SemVer 2 1 1 [NOSI 1] [] > SemVer 2 1 1 [NOSS \"alpha\"] []" $ do
            SemVer 2 1 1 [NOSI 1] [] > SemVer 2 1 1 [NOSS "alpha"] [] `shouldBe` False
