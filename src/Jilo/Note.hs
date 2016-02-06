{-# LANGUAGE OverloadedStrings #-}

module Jilo.Note where

import Network.Wreq
import Control.Lens

list baseApiUrl = do
    r <- get (baseApiUrl ++ "/notes")
    return $ r ^. responseBody
