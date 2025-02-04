-- references:
-- https://en.wikipedia.org/wiki/Federal_holidays_in_the_United_States

module Holidays.UnitedStates (
  usaHolidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

usaHolidays :: (DateFinders, DateTransforms)
usaHolidays =
  ( [ newYears,
      (3 `mon`) . after . jan 1, -- Martin Luther King's birthday
      (3 `mon`) . after . feb 1, -- Georges Washington's birthday
      (1 `mon`) . before . jun 1, -- memorial day, last monday of may
      jun 19, -- juneteenth independence day
      jul 4, -- independence day
      (1 `mon`) . after . sep 1, -- labor day
      (2 `mon`) . after . oct 1, -- columbus day
      nov 11, -- veterans day,
      (4 `thurs`) . after . nov 1, -- thanksgiving day
      christmas
    ],
    []
  )