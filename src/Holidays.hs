{-# LANGUAGE OverloadedStrings #-}

module Holidays (
  ISO_3166_1_Alpha_3,
  day,
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