module Holidays.Base (
  ISO_3166_1_Alpha_3,
  Year,
  day,
  sundayRule,
) where

import Data.Text qualified as TX
import Data.Time

-- 3-letter country codes
type ISO_3166_1_Alpha_3 = TX.Text

day :: Year -> MonthOfYear -> DayOfMonth -> Day
day = fromGregorian

-- general transformations
sundayRule :: Day -> Day
sundayRule d = if dayOfWeek d == Sunday then addDays 1 d else d -- mon after holiday