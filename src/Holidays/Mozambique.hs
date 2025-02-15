-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Mozambique

module Holidays.Mozambique (
  holidays,
) where

import Holidays.DateFinder
import Holidays.DateTransform

holidays :: (DateFinders, DateTransforms)
holidays =
  ( [ newYearsDay,
      feb 3, -- heroes day
      apr 7, -- womens day
      workersDay,
      jun 25, -- independence day
      sep 7, -- victory day
      sep 25, --- armed forces day
      oct 4, -- day of peace and reconciliation
      christmasDay -- family day
    ],
    []
  )