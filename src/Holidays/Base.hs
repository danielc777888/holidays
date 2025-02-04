module Holidays.Base (
  ISO_3166_1_Alpha_3,
  Year,
  day,
) where

import Data.Text qualified as TX
import Data.Time

-- 3-letter country codes
type ISO_3166_1_Alpha_3 = TX.Text


day :: Year -> MonthOfYear -> DayOfMonth -> Day
day = fromGregorian
