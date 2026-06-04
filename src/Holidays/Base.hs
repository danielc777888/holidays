module Holidays.Base (
  Holiday (..),
  ISO_3166_1_Alpha_3 (..),
  Region,
  day,
  hday,
  mkCountryCode,
  nullDay,
  validDay,
) where

import qualified Data.Text as T
import Data.Time

-- | 3-letter country codes.
data ISO_3166_1_Alpha_3
  = DEU
  | GBR
  | ISR
  | MOZ
  | NAM
  | USA
  | ZAF
  deriving (Show)

-- | Custom regions for a country.
type Region = T.Text

data Holiday
  = Holiday
  { holidayKey :: T.Text,
    holidayValue :: Day
  }
  deriving (Ord, Eq, Show)

-- | Constructor for country code.
mkCountryCode :: T.Text -> Maybe ISO_3166_1_Alpha_3
mkCountryCode t =
  case t of
    "DEU" -> Just DEU
    "GBR" -> Just GBR
    "ISR" -> Just ISR
    "MOZ" -> Just MOZ
    "NAM" -> Just NAM
    "USA" -> Just USA
    "ZAF" -> Just ZAF
    _ -> Nothing

-- | Constructor for a Day. Equivalent to the fromGregorian function.
day :: Year -> MonthOfYear -> DayOfMonth -> Day
day = fromGregorian

-- | Constructor for a Holiday.
hday :: T.Text -> Day -> Holiday
hday k d = Holiday {holidayKey = k, holidayValue = d}

-- | Convention for filtering out invalid dates.
nullDay :: Day
nullDay = day 0 0 0

-- | Day is valid if its not a nullDate
validDay :: Day -> Bool
validDay = not . (nullDay ==)
