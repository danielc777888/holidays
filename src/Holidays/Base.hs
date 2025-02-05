module Holidays.Base (
  ISO_3166_1_Alpha_3,
  Region,
  day,
) where

import Data.Text qualified as T
import Data.Time

-- 3-letter country codes
type ISO_3166_1_Alpha_3 = T.Text

-- Custom regions for a country
type Region = T.Text

day :: Year -> MonthOfYear -> DayOfMonth -> Day
day = fromGregorian
