{-# LANGUAGE OverloadedStrings #-}

module Jilo.Cli where

import Jilo.Commands
import qualified Data.Text as T

parseArgs :: [String] -> Command
parseArgs ("note" : note) = AddNote $ T.pack $ unwords note
parseArgs ["list", "note"] = ListNotes
parseArgs ["list", what] = NotImplemented (T.append "list " $ T.pack what)
parseArgs ("graph" : _) = NotImplemented "graph"
parseArgs ("share" : _) = NotImplemented "share"
parseArgs ("stats" : _) = NotImplemented "stats"
parseArgs ("friend" : _) = NotImplemented "friend"
parseArgs ("task" : _) = NotImplemented "task"
parseArgs ("appt" : _) = NotImplemented "appt"
parseArgs _ = Usage
