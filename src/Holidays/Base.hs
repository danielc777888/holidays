module Holidays.Base (
  Holiday (..),
  ISO_3166_1_Alpha_3,
  Year,
  defaultBounds,
  narrowHolidays,
  easter,
  holiday,
  inBounds,
  boundedHoliday,
  sundayRule,
) where

import Data.Set qualified as S
import Data.Text qualified as TX
import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

-- types
type Year = Word16

-- 3-letter country codes
type ISO_3166_1_Alpha_3 = TX.Text

data Holiday = Holiday
  { day :: T.Day,
    bounds :: (Year, Year)
  }
  deriving (Show)

defaultBounds :: (Year, Year)
defaultBounds = (minBound :: Year, maxBound :: Year)

holiday :: T.DayOfMonth -> T.MonthOfYear -> Year -> Holiday
holiday d m y = Holiday {day = T.fromGregorian (fromIntegral y) m d, bounds = (minBound :: Year, maxBound :: Year)}

narrowHolidays :: [Holiday] -> S.Set T.Day
narrowHolidays = S.fromList . map day . filter inBounds

boundedHoliday :: T.DayOfMonth -> T.MonthOfYear -> Year -> (Year, Year) -> Holiday
boundedHoliday d m y (start, end) = Holiday {day = T.fromGregorian (fromIntegral y) m d, bounds = (start, end)}

easter :: Year -> T.Day
easter year = gregorianEaster (fromIntegral year)

inBounds :: Holiday -> Bool
inBounds (Holiday day (start, end)) =
  let (year, _, _) = T.toGregorian day
  in  year >= fromIntegral start && year <= fromIntegral end

-- general transformations
sundayRule :: T.Day -> T.Day
sundayRule day = if T.dayOfWeek day == T.Sunday then T.addDays 1 day else day
