-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia
{-# LANGUAGE OverloadedStrings #-}

module Holidays.Namibia (
  holidays,
) where

import Data.Time

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform (DateTransform, sundayRule)

holidays :: ([Year -> Holiday], [DateTransform])
holidays =
  ( [ hday "new_years_day" . newYearsDay,
      hday "independence_day" . mar 21,
      hday "good_friday" . goodFriday,
      hday "easter_sunday" . easterSunday,
      hday "ascension_day" . ascensionDay,
      hday "workers_day" . workersDay,
      hday "cassinga_day" . may 4,
      hday "africa_day" . may 25,
      hday "heroes_day" . aug 26,
      hday "human_rights_day" . dec 10,
      hday "christmas_day" . christmasDay,
      hday "family_day" . boxingDay,
      hday "genocide_remembrance_day" . years (>= 2025) . may 28
    ],
    [sundayRule]
  )