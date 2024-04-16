module Main where

import Paths_buildtool

main :: IO ()
main = putStrLn . ("The build tool's data dir: " ++) =<< getDataDir
