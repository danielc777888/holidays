-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_the_United_Kingdom
{-# LANGUAGE OverloadedStrings #-}

module Holidays.UnitedKingdom (
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
      hday "easter_sunday" . easterSunday,
      hday "early_may_bank_holiday" . (1 `mon`) . after . may 1,
      hday "spring_bank_holiday" . (1 `mon`) . before . jun 1,
      hday "summer_bank_holiday" . (1 `mon`) . before . sep 1,
      hday "christmas_day" . christmasDay,
      hday "boxing_day" . boxingDay
    ],
    [substituteRule]
  )