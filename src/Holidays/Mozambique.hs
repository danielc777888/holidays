-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Mozambique
{-# LANGUAGE OverloadedStrings #-}

module Holidays.Mozambique (
  holidays,
) where

import Data.Time

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform

holidays :: ([Year -> Holiday], [DateTransform])
holidays =
  ( [ hday "new_years_day" . newYearsDay,
      hday "heroes_day" . feb 3,
      hday "womens_day" . apr 7,
      hday "workers_day" . workersDay,
      hday "independence_day" . jun 25,
      hday "victory_day" . sep 7,
      hday "armed_forces_day" . sep 25,
      hday "day_of_peace_and_reconciliation" . oct 4,
      hday "family_day" . christmasDay
    ],
    []
  )