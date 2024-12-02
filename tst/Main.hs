module Main where

import Data.Time
import Holidays

main :: IO ()
main = print $ "ZAF" <> show (holidays 2024 "ZAF")
