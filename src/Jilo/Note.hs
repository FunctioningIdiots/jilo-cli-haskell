{-# LANGUAGE OverloadedStrings #-}

module Jilo.Note where

import Network.Wreq
import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Aeson.Lens
import qualified Data.Vector as V
import qualified Data.Text as T

data Note = Note { text :: T.Text }

instance ToJSON Note where
    toJSON (Note text) = object ["note" .= object ["text" .= text]]

noteUrl :: String -> String
noteUrl baseApiUrl = baseApiUrl ++ "/note"

list :: String -> IO [T.Text]
list baseApiUrl = do
    r <- get $ noteUrl baseApiUrl
    let notesTexts = r ^. responseBody . key "data" . _Array
    return $ V.toList $ V.map (^. key "text" . _String) notesTexts

add baseApiUrl note = do
    r <- post (noteUrl baseApiUrl) (toJSON note)
    return $ r ^. responseStatus . statusMessage
