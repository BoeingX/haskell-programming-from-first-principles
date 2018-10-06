{-# LANGUAGE QuasiQuotes #-}
module ParserCombinators.ChapterExercises.LogFileSpec where

import Test.Hspec
import Text.Trifecta
import Text.RawString.QQ
import ParserCombinators.ChapterExercises.LogFile

dailyEx :: String
dailyEx = [r|# 2025-02-05
08:00 Breakfast
09:00 Sanitizing moisture collector
11:00 Exercising in high-grav gym
12:00 Lunch
13:00 Programming
17:00 Commuting home in rover
17:30 R&R
19:00 Dinner
21:00 Shower
21:15 Read
22:00 Sleep
|]

logEx :: String
logEx = [r|
-- wheee a comment

# 2025-02-05



08:00 Breakfast
09:00 Sanitizing moisture collector
11:00 Exercising in high-grav gym
12:00 Lunch
13:00 Programming
17:00 Commuting home in rover
17:30 R&R
19:00 Dinner
21:00 Shower
21:15 Read
22:00 Sleep

# 2025-02-07 -- dates not nececessarily sequential

08:00 Breakfast -- should I try skippin bfast?

09:00 Bumped head, passed out
13:36 Wake up, headache
13:37 Go to medbay
13:40 Patch self up
13:45 Commute home for rest
14:15 Read
21:00 Dinner
21:15 Read

22:00 Sleep
|]

spec :: Spec
spec = do
    describe "Test parseDate" $ do
        it "parseString parseDate mempty \"# 2025-02-05\"" $ do
            parseString parseDate mempty "# 2025-02-05" `shouldBe` Success (Date 2025 2 5)
        it "parseString parseDate mempty \"# 2025-02-05 -- This is comment\"" $ do
            parseString parseDate mempty "# 2025-02-05" `shouldBe` Success (Date 2025 2 5)
    describe "Test parseTime" $ do
        it "parseString parseTime mempty \"08:00\"" $ do
            parseString parseTime mempty "08:00" `shouldBe` Success (Time 8 0)
    describe "Test parseActivity" $ do
        it "parseString parseActivity mempty \"08:00 Breakfast\"" $ do
            parseString parseActivity mempty "08:00 Breakfast" `shouldBe` Success (Activity (Time 8 0) "Breakfast")
        it "parseString parseActivity mempty \"08:00 Breakfast -- This is comment\"" $ do
            parseString parseActivity mempty "08:00 Breakfast -- This is comment" `shouldBe` Success (Activity (Time 8 0) "Breakfast")
        it "parseString parseActivity mempty \"11:00 Exercising in high-grav gym\"" $ do
            parseString parseActivity mempty "11:00 Exercising in high-grav gym" `shouldBe` Success (Activity (Time 11 0) "Exercising in high-grav gym")
    describe "Test parseDaily" $ do
        it "parseString parseDaily mempty dailyEx" $ do
            parseString parseDaily mempty dailyEx `shouldBe` Success (Daily (Date 2025 2 5) [Activity (Time 8 0) "Breakfast",Activity (Time 9 0) "Sanitizing moisture collector",Activity (Time 11 0) "Exercising in high-grav gym",Activity (Time 12 0) "Lunch",Activity (Time 13 0) "Programming",Activity (Time 17 0) "Commuting home in rover",Activity (Time 17 30) "R&R",Activity (Time 19 0) "Dinner",Activity (Time 21 0) "Shower",Activity (Time 21 15) "Read",Activity (Time 22 0) "Sleep"])
    describe "Test parseLog" $ do
        it "parseString parseLog mempty dailyEx" $ do
            parseString parseLog mempty dailyEx `shouldBe` Success ([Daily (Date 2025 2 5) [Activity (Time 8 0) "Breakfast",Activity (Time 9 0) "Sanitizing moisture collector",Activity (Time 11 0) "Exercising in high-grav gym",Activity (Time 12 0) "Lunch",Activity (Time 13 0) "Programming",Activity (Time 17 0) "Commuting home in rover",Activity (Time 17 30) "R&R",Activity (Time 19 0) "Dinner",Activity (Time 21 0) "Shower",Activity (Time 21 15) "Read",Activity (Time 22 0) "Sleep"]])
        it "parseString parseLog mempty logEx" $ do
            parseString parseLog mempty logEx `shouldBe` Success [Daily (Date 2025 2 5) [Activity (Time 8 0) "Breakfast",Activity (Time 9 0) "Sanitizing moisture collector",Activity (Time 11 0) "Exercising in high-grav gym",Activity (Time 12 0) "Lunch",Activity (Time 13 0) "Programming",Activity (Time 17 0) "Commuting home in rover",Activity (Time 17 30) "R&R",Activity (Time 19 0) "Dinner",Activity (Time 21 0) "Shower",Activity (Time 21 15) "Read",Activity (Time 22 0) "Sleep"],Daily (Date 2025 2 7) [Activity (Time 8 0) "Breakfast",Activity (Time 9 0) "Bumped head, passed out",Activity (Time 13 36) "Wake up, headache",Activity (Time 13 37) "Go to medbay",Activity (Time 13 40) "Patch self up",Activity (Time 13 45) "Commute home for rest",Activity (Time 14 15) "Read",Activity (Time 21 0) "Dinner",Activity (Time 21 15) "Read",Activity (Time 22 0) "Sleep"]]
    describe "Test summary" $ do
        it "summary xs" $ do
            let xs = parseString parseLog mempty logEx
                res = Success [("Breakfast",120),("Bumped head, passed out",276),("Commute home for rest",30),("Commuting home in rover",30),("Dinner",135),("Exercising in high-grav gym",60),("Go to medbay",3),("Lunch",60),("Patch self up",5),("Programming",240),("R&R",90),("Read",495),("Sanitizing moisture collector",120),("Shower",15),("Wake up, headache",1)]
            summary <$> xs `shouldBe` res
    describe "Test avgTime" $ do
        it "avgTime xs" $ do
            let xs = parseString parseLog mempty logEx
                res = Success [("Breakfast",60.0),("Bumped head, passed out",138.0),("Commute home for rest",15.0),("Commuting home in rover",15.0),("Dinner",67.5),("Exercising in high-grav gym",30.0),("Go to medbay",1.5),("Lunch",30.0),("Patch self up",2.5),("Programming",120.0),("R&R",45.0),("Read",247.5),("Sanitizing moisture collector",60.0),("Shower",7.5),("Wake up, headache",0.5)]
            avgTime <$> xs `shouldBe` res
