module Holidays.Base (
  Country (..),
  ISO_3166_1_Alpha_3,
  Year (..),
  annualHoliday,
  easterHoliday,
  mkCountry,
) where

import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

newtype Year = Year Word16

annualHoliday :: Year -> T.MonthOfYear -> T.DayOfMonth -> T.Day
annualHoliday (Year year) = T.fromGregorian (fromIntegral year)

easterHoliday :: Year -> T.Day
easterHoliday (Year year) = gregorianEaster (fromIntegral year)

-- Three-letter country codes
type ISO_3166_1_Alpha_3 = String

data Country = ZAF deriving (Show)

mkCountry :: ISO_3166_1_Alpha_3 -> Maybe Country
mkCountry countryCode =
  case countryCode of
    "ZAF" -> Just ZAF
    _ -> Nothing