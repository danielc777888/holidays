-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_South_Africa

module Holidays.SouthAfrica (
  zafHolidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

zafHolidays :: (DateFinders, DateTransforms)
zafHolidays =
  ( [ newYears,
      goodFriday,
      easter, -- family day
      mar 21, -- human right day
      apr 27, -- freedom day
      may 1, -- workers day
      jun 16, -- youth day
      aug 9, -- womens day
      sep 24, -- heritage day
      dec 16, -- day of reconciliation
      christmas,
      boxingDay, -- day of goodwill
      years (== 2024) . may 29 -- general elections 2024
    ],
    [sundayRule]
  )