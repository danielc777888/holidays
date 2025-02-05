-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia

module Holidays.Namibia (
  holidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

-- Namibia public holidays
holidays :: (DateFinders, DateTransforms)
holidays =
  ( [ newYearsDay,
      mar 21, -- independence day
      goodFriday,
      easterSunday,
      ascensionDay,
      workersDay,
      may 4, -- cassinga day
      may 25, -- africa day
      aug 26, -- heroes day
      dec 10, -- human rights day
      christmasDay,
      boxingDay, -- family day
      years (>= 2025) . may 28 -- genocide remembrance day
    ],
    [sundayRule]
  )