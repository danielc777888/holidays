-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_the_United_Kingdom

module Holidays.UnitedKingdom (
  holidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

holidays :: (DateFinders, DateTransforms)
holidays =
  ( [ newYearsDay,
      goodFriday,
      easterSunday,
      (1 `mon`) . after . may 1, -- early may bank holiday
      (1 `mon`) . before . jun 1, -- spring bank holiday
      (1 `mon`) . before . sep 1, -- summer bank holiday
      christmasDay,
      boxingDay
    ],
    [substituteRule]
  )