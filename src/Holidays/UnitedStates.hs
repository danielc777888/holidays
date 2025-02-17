-- references:
-- https://en.wikipedia.org/wiki/Federal_holidays_in_the_United_States
{-# LANGUAGE OverloadedStrings #-}

module Holidays.UnitedStates (
  holidays,
) where

import Data.Time

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform

holidays :: ([Year -> Holiday], [DateTransform])
holidays =
  ( [ hday "new_years_day" . newYearsDay,
      hday "martin_luther_kings_birthday" . (3 `mon`) . after . jan 1,
      hday "george_washingtons_birthday" . (3 `mon`) . after . feb 1,
      hday "memorial_day" . (1 `mon`) . before . jun 1,
      hday "juneteenth_independence_day" . jun 19,
      hday "independence_day" . jul 4,
      hday "labor_day" . (1 `mon`) . after . sep 1,
      hday "columbus_day" . (2 `mon`) . after . oct 1,
      hday "veterans_day" . nov 11,
      hday "thanksgiving_day" . (4 `thurs`) . after . nov 1,
      hday "christmas_day" . christmasDay
    ],
    []
  )