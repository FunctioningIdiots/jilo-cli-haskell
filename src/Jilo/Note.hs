{-# LANGUAGE OverloadedStrings #-}

module Jilo.Note where

import Network.Wreq
import Control.Lens
import Data.Aeson.Lens

list baseApiUrl = do
    r <- get (baseApiUrl ++ "/notes")
    return $ r ^. responseBody . key "data" . nth 0 . key "text" . _String
