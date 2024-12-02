module Holidays.SouthAfrica (
  holidays,
  Holiday(..)
) where

-- holidays :: Country -> [Year] -> [Holiday]

-- holidays :: [Year] -> [Holiday]

import Data.Time

data Holiday = Holiday
                 { day        :: Day
                 , month      :: Int
                 , name       :: String
                 , instituted :: Int
                 }
     deriving (Show)

minYear :: Int
minYear = 1910

maxYear :: Int
maxYear = 3000

years :: [Int]
years = [minYear..maxYear]

workersDay :: Holiday
workersDay = Holiday {
    day = fromGregorian 0 5 1,
    month = 1,
    name = "Workers Day",
    instituted = 1995
  }

holidays :: [Holiday]
holidays = concat (go years)
  where go :: [Int] -> [[Holiday]]
        go [] = [[]]
        go (x:xs)
          | x >= instituted workersDay = [holiday x workersDay]: go xs
          | otherwise = go xs

holiday :: Int -> Holiday -> Holiday
holiday year h = Holiday { day = day', month = 1, name = name', instituted = instituted' }
  where (_, m, d) = toGregorian (fromGregorian 0 5 1)
        day' = fromGregorian (toInteger year) m d
        name' = name h
        instituted' = instituted h

       
