-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia
-- https://mict.gov.na/public-holidays
{-# LANGUAGE OverloadedStrings #-}

module Holidays.Namibia (
  namHolidays,
) where

import Data.Time

import Data.Set qualified as S
import Holidays.Base
import Holidays.Base qualified as H

-- Namibia public holidays
namHolidays :: H.Year -> S.Set H.Holiday
namHolidays year =
  let
    e = easter year
    (_, gfMonth, gfDay) = toGregorian (addDays (-2) e)
    (_, emMonth, emDay) = toGregorian (addDays 1 e)
    (_, adMonth, adDay) = toGregorian (addDays 39 e)
    hs =
      [ holiday "New Years Day" 1 1 year,
        holiday "Independence Day" 21 3 year,
        holiday "Good Friday" gfDay gfMonth year,
        holiday "Easter Monday" emDay emMonth year,
        holiday "Workers Day" 1 5 year,
        holiday "Cassinga Day" 4 5 year,
        holiday "Ascension Day" adDay adMonth year,
        holiday "Africa Day" 25 5 year,
        duration (holiday "Genocide Remembrance Day" 28 5 year) (Year 2025) (Year 2026),
        holiday "Heroes Day" 26 8 year,
        holiday "Human Rights Day" 10 12 year,
        holiday "Christmas Day" 25 12 year,
        holiday "Family Day" 26 12 year
      ]
  in
    S.fromAscList (map H.sundayRule hs)