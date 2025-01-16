-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia

module Holidays.Namibia (
  namHolidays,
) where

import Data.Set qualified as S
import Data.Time

import Holidays.Base
import Holidays.Base qualified as H

-- Namibia public holidays
namHolidays :: H.Year -> S.Set Day
namHolidays year =
  let
    newYearsDay = holiday 1 1 year
    independenceDay = holiday 21 3 year

    goodFriday = Holiday {day = addDays (-2) (easter year), bounds = defaultBounds}
    easterDay = Holiday {day = easter year, bounds = defaultBounds}
    ascensionDay = Holiday {day = addDays 39 (easter year), bounds = defaultBounds}

    workersDay = holiday 1 5 year
    cassingaDay = holiday 4 5 year
    africaDay = holiday 25 5 year
    genocideRemembranceDay = boundedHoliday 28 5 year (2025, maxBound :: H.Year)

    heroesDay = holiday 26 8 year
    humanRightsDay = holiday 10 12 year
    christmasDay = holiday 25 12 year
    familyDay = holiday 26 12 year

    hs =
      [ newYearsDay,
        independenceDay,
        goodFriday,
        easterDay,
        ascensionDay,
        workersDay,
        cassingaDay,
        africaDay,
        genocideRemembranceDay,
        heroesDay,
        humanRightsDay,
        christmasDay,
        familyDay
      ]
  in
    narrowHolidays $ map (\h -> h {day = sundayRule (day h)}) hs
