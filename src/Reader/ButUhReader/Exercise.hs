module Reader.ButUhReader.Exercise where
    
newtype Reader r a = Reader { runReader :: r -> a }

ask :: Reader a a
ask = Reader id
