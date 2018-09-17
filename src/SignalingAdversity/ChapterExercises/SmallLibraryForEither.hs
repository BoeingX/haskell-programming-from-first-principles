module SignalingAdversity.ChapterExercises.SmallLibraryForEither where

lefts' :: [Either a b] -> [a]
lefts' = foldr f []
            where f (Left a) acc = a : acc
                  f _        acc = acc

rights' :: [Either a b] -> [b]
rights' = foldr f []
            where f (Right b) acc = b : acc
                  f _         acc = acc

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr f ([], [])
                    where f (Left a) (l, r) = (a : l, r)
                          f (Right b) (l, r) = (l, b : r)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just (f b)

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a)  = f a
either' _ g (Right b) = g b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)
