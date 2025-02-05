-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_South_Africa

module Holidays.SouthAfrica (
  holidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

holidays :: (DateFinders, DateTransforms)
holidays =
  ( [ newYearsDay,
      goodFriday,
      easterSunday, -- family day
      mar 21, -- human right day
      apr 27, -- freedom day
      workersDay,
      jun 16, -- youth day
      aug 9, -- womens day
      sep 24, -- heritage day
      dec 16, -- day of reconciliation
      christmasDay,
      boxingDay, -- day of goodwill
      years (== 2024) . may 29 -- general elections 2024
    ],
    [sundayRule]
  )