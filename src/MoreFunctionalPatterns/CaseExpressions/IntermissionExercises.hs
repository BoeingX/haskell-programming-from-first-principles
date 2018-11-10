module MoreFunctionalPatterns.CaseExpressions.IntermissionExercises where

functionC x y = case compare x y of
                    GT -> x
                    _ -> y

ifEvenAdd2 n = case even n of 
                    True -> n+2
                    _ -> n

nums x = case compare x 0 of
           LT -> -1
           EQ -> 0
           GT -> 1
