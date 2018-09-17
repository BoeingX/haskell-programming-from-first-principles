module SignalingAdversity.ChapterExercises.SmallLibraryForMaybe where

-- Question 1
isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust _        = False

isNothing :: Maybe a -> Bool
isNothing = not . isJust

-- Question 2
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b f (Just a) = f a
mayybee b _ Nothing  = b

-- Question 3
fromMaybe :: a -> Maybe a -> a
fromMaybe a Nothing  = a
fromMaybe _ (Just a) = a

fromMaybe' :: a -> Maybe a -> a
fromMaybe' a = mayybee a id 

-- Question 4
listToMaybe :: [a] -> Maybe a
listToMaybe (x:xs)  = Just x
listToMaybe _       = Nothing

maybeToList :: Maybe a -> [a]
maybeToList (Just a) = [a]
maybeToList _        = []

-- Question 5
catMaybes :: [Maybe a] -> [a]
catMaybes = map (fromMaybe undefined) . filter isJust

-- Question 6
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs
    | any isNothing xs  = Nothing
    | otherwise         = Just $ catMaybes xs
