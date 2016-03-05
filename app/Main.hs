{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment

import Jilo.Note as Note
import Jilo.Cli
import Jilo.Commands
import qualified Data.Text.IO as TIO
import qualified Data.ByteString.Char8 as BSC8

main :: IO ()
main = do
    let baseApiUrl = "http://localhost:4000/api"
    args <- getArgs
    case parseArgs args of
        NotImplemented command -> TIO.putStrLn $ notImplemented command
        AddNote noteText -> do
            msg <- Note.add baseApiUrl $ Note noteText
            BSC8.putStrLn msg
        ListNotes -> do
            notes <- Note.list baseApiUrl
            print notes
        Usage -> TIO.putStrLn usage
