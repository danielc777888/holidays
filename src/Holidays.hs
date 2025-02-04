{-# LANGUAGE OverloadedStrings #-}

{- |
This module determines public holidays based on country code and year.
-}
module Holidays (
  ISO_3166_1_Alpha_3,
  holidays,
)
where

import Data.Set qualified as S
import Data.Time
import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform
import Holidays.Namibia
import Holidays.SouthAfrica
import Holidays.UnitedKingdom
import Holidays.UnitedStates

{- |
Returns a set of public holidays based on the country code (ISO_3166_1_Alpha_3) and a specific year.
If a country is not supported an empty set is returned.

Example:

@
hs = holidays "USA" 2025
@
-}
holidays :: ISO_3166_1_Alpha_3 -> Year -> S.Set Day
holidays countryCode year =
  case countryCode of
    "GBR" -> apply year gbrHolidays
    "NAM" -> apply year namHolidays
    "USA" -> apply year usaHolidays
    "ZAF" -> apply year zafHolidays
    _ -> S.empty

apply :: Year -> (DateFinders, DateTransforms) -> S.Set Day
apply year (finders, transforms) =
  let validDays = filter valid $ map (\d -> d year) finders
  in  foldr (\d ds -> S.insert (foldr (\t d' -> t ds d') d transforms) ds) S.empty validDays