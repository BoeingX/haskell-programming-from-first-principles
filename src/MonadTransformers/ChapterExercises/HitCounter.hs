{-# LANGUAGE OverloadedStrings #-}
module MonadTransformers.ChapterExercises.HitCounter where

import Control.Monad.Trans.Class
import Control.Monad.Trans.Reader
import Data.IORef
import qualified Data.Map as M
import Data.Maybe (fromMaybe)
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as TL
import System.Environment (getArgs)
import Web.Scotty.Trans
import Network.Wai.Internal

data Config =
    Config {
        -- that's one, one click!
        -- two...two clicks!
        -- Three BEAUTIFUL clicks! ah ah ahhhh
        counts :: IORef (M.Map Text Integer)
      , prefix :: Text
    }

-- Stuff inside ScottyT is, except for things that escape
-- via IO, effectively read-only so we can't use StateT.
-- It would overcomplicate things to attempt to do so and
-- you should be using a proper database for production
-- applications.
type Scotty = ScottyT Text (ReaderT Config IO)
type Handler = ActionT Text (ReaderT Config IO)

bumpBoomp :: Text
          -> M.Map Text Integer
          -> (M.Map Text Integer, Integer)
bumpBoomp k m = (newM, n)
    where n = M.findWithDefault 1 k m
          newM = M.insert k (n + 1) m

updateAndGet :: Text -> Config -> IO Integer
updateAndGet key config = do
    let counter = counts config :: IORef (M.Map Text Integer)
    (m, n) <- bumpBoomp key <$> (readIORef counter :: IO (M.Map Text Integer))
    -- Very important to use writeIORef or something equivalent
    -- otherwise the counter will not be updated
    writeIORef counter m
    return n

app :: Scotty ()
app = get "/:key" $ do
    unprefixed <- param "key"
    p <- lift $ ReaderT (return . prefix)
    let key' = mappend p unprefixed
    newInteger <- lift $ ReaderT $ updateAndGet key'
    html $ mconcat [ "<h1>Success! Count was: "
                   , TL.pack $ show newInteger
                   , "</h1>"
                   ]

main :: IO ()
main = do
    [prefixArg] <- getArgs
    counter <- newIORef M.empty
    let config = Config counter (TL.pack prefixArg)
        runR = flip runReaderT config :: ReaderT Config IO Response -> IO Response
    scottyT 3000 runR app
