module Holidays.Base (
  Year (..),
  annualHoliday,
  easterHoliday,
) where

import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

newtype Year = Year Word16

annualHoliday :: Year -> T.MonthOfYear -> T.DayOfMonth -> T.Day
annualHoliday (Year year) = T.fromGregorian (fromIntegral year)

easterHoliday :: Year -> T.Day
easterHoliday (Year year) = gregorianEaster (fromIntegral year)