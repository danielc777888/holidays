{-# LANGUAGE OverloadedStrings #-}

module Holidays.Base (
  Country (..),
  ISO_3166_1_Alpha_3 (..),
  Year (..),
  Holiday (..),
  duration,
  filterOnYear,
  easter,
  holiday,
  holidays,
  country,
  sundayRule,
) where

import Data.Maybe
import Data.Set qualified as S
import Data.Text qualified as TX
import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

newtype Year = Year Word16 deriving (Show, Eq, Ord)

data Holiday = Holiday
  { name :: TX.Text,
    day :: T.Day,
    start :: Year,
    end :: Maybe Year
  }
  deriving (Eq, Ord, Show)

holiday :: TX.Text -> T.DayOfMonth -> T.MonthOfYear -> Year -> Holiday
holiday n d m (Year y) = Holiday {name = n, day = T.fromGregorian (fromIntegral y) m d, start = Year 0, end = Nothing}

duration :: Holiday -> Year -> Year -> Holiday
duration h s e = h {start = s, end = Just e}

easter :: Year -> T.Day
easter (Year year) = gregorianEaster (fromIntegral year)

-- General transformations
sundayRule :: Holiday -> Holiday
sundayRule h = if T.dayOfWeek d == T.Sunday then h {day = T.addDays 1 d} else h {day = d}
  where
    d = day h

filterOnYear :: S.Set Holiday -> Year -> S.Set Holiday
filterOnYear hs year = S.filter (\h -> year >= start h && (isNothing (end h) || year < fromJust (end h))) hs

holidays :: Year -> (Year -> S.Set Holiday) -> S.Set Holiday
holidays year f = filterOnYear (f year) year

-- Three-letter country codes
data ISO_3166_1_Alpha_3
  = NAM
  | ZAF
  deriving (Show)

data Country
  = Country
  { isoCode :: ISO_3166_1_Alpha_3,
    regions :: [TX.Text]
  }
  deriving (Show)

country :: TX.Text -> [TX.Text] -> Maybe Country
country isoCode regions =
  case isoCode of
    "NAM" -> Just (Country {isoCode = NAM, regions = regions})
    "ZAF" -> Just (Country {isoCode = ZAF, regions = regions})
    _ -> Nothing