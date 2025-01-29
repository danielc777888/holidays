{-# LANGUAGE OverloadedStrings #-}

module Holidays (
  ISO_3166_1_Alpha_3,
  day,
  holidays,
  sundayRule,
)
where

import Data.Set qualified as S
import Data.Time
import Holidays.Base
import Holidays.Namibia
import Holidays.SouthAfrica
import Holidays.UnitedStates

holidays :: ISO_3166_1_Alpha_3 -> Year -> S.Set Day
holidays countryCode year =
  case countryCode of
    "NAM" -> namHolidays year
    "USA" -> usaHolidays year
    "ZAF" -> zafHolidays year
    _ -> S.empty
