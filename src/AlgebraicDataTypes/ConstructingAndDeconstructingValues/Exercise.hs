module AlgebraicDataTypes.ConstructingAndDeconstructingValues.Exercise where

import Control.Applicative

data OperatingSystem =
    GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgrammingLanguage =
    Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)

data Programmer =
    Programmer { os :: OperatingSystem
               , lang :: ProgrammingLanguage }
    deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = liftA2 Programmer allOperatingSystems allLanguages

-- Or without using Applicative
allProgrammers' :: [Programmer]
allProgrammers' = [Programmer os lang | os <- allOperatingSystems, lang <- allLanguages]
