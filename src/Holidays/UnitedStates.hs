-- references:
-- https://en.wikipedia.org/wiki/Federal_holidays_in_the_United_States

module Holidays.UnitedStates (
  usaHolidays,
) where

import Data.Time

import Data.Set qualified as S
import Holidays.DateFinder

-- Annual holidays
usaHolidays :: Year -> S.Set Day
usaHolidays year =
  let
    newYearsDay = jan 1
    birthdayMartinLutherKing = (3 `mon`) . after . jan 1
    birthdayWashington = (3 `mon`) . after . feb 1
    memorialDay =  (1 `mon`) . before . jun 1 -- last monday of may
    juneteenthIndependenceDay = jun 19
    independenceDay = jul 4
    laborDay = (1 `mon`) . after . sep 1
    columbusDay = (2 `mon`) . after . oct 1
    veteransDay = nov 11
    thanksgivingDay = (4 `thurs`) . after . nov 1
    hs =
      [ newYearsDay,
        birthdayMartinLutherKing,
        birthdayWashington,
        memorialDay,
        juneteenthIndependenceDay,
        independenceDay,
        laborDay,
        columbusDay,
        veteransDay,
        thanksgivingDay,
        christmas
      ]
    hs' = map (\h -> h year) hs -- apply year
  in
    S.fromList $ filter valid hs'