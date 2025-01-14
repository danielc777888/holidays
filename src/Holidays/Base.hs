module Holidays.Base (
  Country (..),
  ISO_3166_1_Alpha_3,
  Year (..),
  Holiday (..),
  annualHoliday,
  filterOnYear,
  easterHoliday,
  holidays,
  mkCountry,
  sundayRule,
) where

import Data.List
import Data.Maybe
import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

newtype Year = Year Word16 deriving (Show, Eq, Ord)

data Holiday = Holiday
  { day :: T.Day,
    start :: Year,
    end :: Maybe Year
  }
  deriving (Eq, Ord)

annualHoliday :: Year -> T.MonthOfYear -> T.DayOfMonth -> T.Day
annualHoliday (Year year) = T.fromGregorian (fromIntegral year)

easterHoliday :: Year -> T.Day
easterHoliday (Year year) = gregorianEaster (fromIntegral year)

-- General transformations
sundayRule :: Holiday -> Holiday
sundayRule holiday = if T.dayOfWeek d == T.Sunday then holiday {day = T.addDays 1 d} else holiday {day = d}
  where
    d = day holiday

filterOnYear :: [Holiday] -> Year -> [Holiday]
filterOnYear hs year = filter (\h -> year >= start h && (isNothing (end h) || year < fromJust (end h))) hs

holidays :: Year -> (Year -> [Holiday]) -> [Holiday]
holidays year f =
  let hs = filterOnYear (f year) year
  in  sort hs

-- Three-letter country codes
type ISO_3166_1_Alpha_3 = String

data Country
  = NAM
  | ZAF
  deriving (Show)

mkCountry :: ISO_3166_1_Alpha_3 -> Maybe Country
mkCountry countryCode =
  case countryCode of
    "NAM" -> Just NAM
    "ZAF" -> Just ZAF
    _ -> Nothing