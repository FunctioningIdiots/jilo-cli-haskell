{-# LANGUAGE OverloadedStrings #-}

module Jilo.Note where

import Network.Wreq
import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Aeson.Lens
import qualified Data.Text as T

data Note = Note { text :: T.Text }

instance ToJSON Note where
    toJSON (Note text) = object ["note" .= object ["text" .= text]]

noteUrl :: String -> String
noteUrl baseApiUrl = baseApiUrl ++ "/note"

list baseApiUrl = do
    r <- get $ noteUrl baseApiUrl
    return $ r ^. responseBody . key "data" . values . key "text" . _String

add baseApiUrl note = do
    r <- post (noteUrl baseApiUrl) (toJSON note)
    return $ r ^. responseStatus . statusMessage
