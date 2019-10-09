{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Data.ByteString.Lazy
import           Data.UnixTime
import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Handler.Warp

helloApp :: Application
helloApp _ respond = do
    currentTime <- getUnixTime
    let timeString = fromStrict $ formatUnixTimeGMT webDateFormat currentTime
    respond $ responseLBS status200 [] $ "Hello Haskell runs on IOx!  Now it is " <> timeString

main :: IO ()
main = runSettings (setPort 8080 defaultSettings) helloApp
