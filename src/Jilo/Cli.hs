module Jilo.Cli where

import Jilo.Commands

parseArgs :: [String] -> Command
parseArgs ("note" : note) = AddNote $ unwords note
parseArgs ["list", "note"] = ListNotes
parseArgs ["list", what] = NotImplemented ("list " ++ what)
parseArgs ("graph" : _) = NotImplemented "graph"
parseArgs ("share" : _) = NotImplemented "share"
parseArgs ("stats" : _) = NotImplemented "stats"
parseArgs ("friend" : _) = NotImplemented "friend"
parseArgs ("task" : _) = NotImplemented "task"
parseArgs ("appt" : _) = NotImplemented "appt"
parseArgs _ = Usage
