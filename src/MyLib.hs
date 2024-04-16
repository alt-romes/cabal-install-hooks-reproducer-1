{-# LANGUAGE TemplateHaskell #-}
module MyLib (someFunc) where

import Paths_olaola

import Language.Haskell.TH
import System.Process


$( do
    runIO (callCommand "buildtool")
    [d| hi = "hi" |]
 )

someFunc :: IO ()
someFunc = putStrLn =<< getDataDir
