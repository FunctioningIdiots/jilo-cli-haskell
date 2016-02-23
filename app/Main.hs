module Main where

import System.Environment

import Jilo.Note as Note
import Jilo.Cli
import Jilo.Commands

main :: IO ()
main = do
    args <- getArgs
    case parseArgs args of
        NotImplemented command -> putStrLn $ notImplemented command
        AddNote note -> putStrLn $ notImplemented "note"
        ListNotes -> do
            notes <- Note.list "http://localhost:4000/api"
            print notes
        Usage -> putStrLn usage
