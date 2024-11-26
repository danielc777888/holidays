module Main where

import Data.Time
import Holidays

main :: IO ()
main = print (filter(\h ->
                       let (year, _, _) = toGregorian (day h)
                       in year == 2024) holidays)
