module Main where

import Jilo.Note as Note

main :: IO ()
main = do
    notes <- Note.list "http://localhost:4000/api"
    putStrLn $ show notes
