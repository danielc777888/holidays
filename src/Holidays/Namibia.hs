-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia
-- https://mict.gov.na/public-holidays

module Holidays.Namibia (
  annualHolidays,
) where

import Data.Time

import Holidays.Base
import Holidays.Base qualified as H

-- Namibia public holidays
annualHolidays :: H.Year -> [H.Holiday]
annualHolidays year =
  let
    newYearsDay = Holiday {day = annualHoliday year 1 1, start = H.Year 0, end = Nothing}
    independenceDay = Holiday {day = annualHoliday year 3 21, start = H.Year 0, end = Nothing}
    goodFriday = Holiday {day = addDays (-2) (easterHoliday year), start = H.Year 0, end = Nothing}
    easterMonday = Holiday {day = addDays 1 (easterHoliday year), start = H.Year 0, end = Nothing}
    workersDay = Holiday {day = annualHoliday year 5 1, start = H.Year 0, end = Nothing}
    cassingaDay = Holiday {day = annualHoliday year 5 4, start = H.Year 0, end = Nothing}
    ascensionDay = Holiday {day = addDays 39 (easterHoliday year), start = H.Year 0, end = Nothing}
    africaDay = Holiday {day = annualHoliday year 5 25, start = H.Year 0, end = Nothing}
    genocideRemembranceDay = Holiday {day = annualHoliday year 5 28, start = H.Year 2025, end = Just (H.Year 2026)}
    heroesDay = Holiday {day = annualHoliday year 8 26, start = H.Year 0, end = Nothing}
    humanRightsDay = Holiday {day = annualHoliday year 12 10, start = H.Year 0, end = Nothing}
    christmasDay = Holiday {day = annualHoliday year 12 25, start = H.Year 0, end = Nothing}
    familyDay = Holiday {day = annualHoliday year 12 26, start = H.Year 0, end = Nothing}
    hs = [newYearsDay, independenceDay, goodFriday, easterMonday, workersDay, cassingaDay, ascensionDay, africaDay, genocideRemembranceDay, heroesDay, humanRightsDay, christmasDay, familyDay]
  in
    map H.sundayRule hs