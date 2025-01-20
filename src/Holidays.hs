{-# LANGUAGE OverloadedStrings #-}

module Holidays (
  ISO_3166_1_Alpha_3,
  day,
  holidays,
)
where

import Data.Set qualified as S
import Data.Time
import Holidays.Base as H
import Holidays.Namibia
import Holidays.SouthAfrica

holidays :: ISO_3166_1_Alpha_3 -> Year -> S.Set Day
holidays countryCode year =
  case countryCode of
    "NAM" -> namHolidays year
    "ZAF" -> zafHolidays year
    _ -> S.empty
