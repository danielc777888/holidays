{-# LANGUAGE OverloadedStrings #-}

module Holidays.Base (
  Country (..),
  ISO_3166_1_Alpha_3 (..),
  Year (..),
  Holiday (..),
  duration,
  easter,
  holiday,
  country,
  sundayRule,
) where

import Data.Set qualified as S
import Data.Text qualified as TX
import Data.Time qualified as T
import Data.Time.Calendar.Easter
import Data.Word

-- types
newtype Year = Year Word16 deriving (Show, Eq, Ord)

data Holiday = Holiday
  { name :: TX.Text,
    day :: T.Day,
    start :: Year,
    end :: Maybe Year
  }
  deriving (Eq, Ord, Show)

-- 3-letter country codes
data ISO_3166_1_Alpha_3
  = NAM
  | ZAF
  deriving (Show)

data Country
  = Country
  { isoCode :: ISO_3166_1_Alpha_3,
    regions :: S.Set TX.Text
  }
  deriving (Show)

-- constructors
country :: TX.Text -> Maybe Country
country isoCode =
  case isoCode of
    "NAM" -> Just (Country {isoCode = NAM, regions = S.empty})
    "ZAF" -> Just (Country {isoCode = ZAF, regions = S.empty})
    _ -> Nothing

holiday :: TX.Text -> T.DayOfMonth -> T.MonthOfYear -> Year -> Holiday
holiday n d m (Year y) = Holiday {name = n, day = T.fromGregorian (fromIntegral y) m d, start = Year 0, end = Nothing}

easter :: Year -> T.Day
easter (Year year) = gregorianEaster (fromIntegral year)

-- general transformations
duration :: Holiday -> Year -> Year -> Holiday
duration h s e = h {start = s, end = Just e}

sundayRule :: Holiday -> Holiday
sundayRule h = if T.dayOfWeek d == T.Sunday then h {day = T.addDays 1 d} else h {day = d}
  where
    d = day h
