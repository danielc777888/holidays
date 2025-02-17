-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_South_Africa
{-# LANGUAGE OverloadedStrings #-}

module Holidays.SouthAfrica (
  holidays,
) where

import Data.Time

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform

holidays :: ([Year -> Holiday], [DateTransform])
holidays =
  ( [ hday "new_years_day" . newYearsDay,
      hday "good_friday" . goodFriday,
      hday "family_day" . easterSunday,
      hday "human_rights_day" . mar 21,
      hday "freedom_day" . apr 27,
      hday "workers_day" . workersDay,
      hday "youth_day" . jun 16,
      hday "womens_day" . aug 9,
      hday "heritage_day" . sep 24,
      hday "day_of_reconciliation" . dec 16,
      hday "christmas_day" . christmasDay,
      hday "day_of_goodwill" . boxingDay,
      -- special days
      hday "general_elections_2024" . years (== 2024) . may 29
    ],
    [sundayRule]
  )