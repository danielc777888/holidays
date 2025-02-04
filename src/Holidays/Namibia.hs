-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia

module Holidays.Namibia (
  namHolidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

-- Namibia public holidays
namHolidays :: (DateFinders, DateTransforms)
namHolidays =
  ( [ newYears,
      mar 21, -- independence day
      goodFriday,
      easter,
      (39 `days`) . after . easter, -- ascension day
      may 1, -- workers day
      may 4, -- cassinga day
      may 25, -- africa day
      aug 26, -- heroes day
      dec 10, -- human rights day
      christmas,
      boxingDay, -- family day
      years (>= 2025) . may 28 -- genocide remembrance day
    ],
    [sundayRule]
  )