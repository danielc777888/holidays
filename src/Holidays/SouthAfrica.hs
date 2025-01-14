-- references:
-- https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  annualHolidays,
) where

import Data.Time

import Holidays.Base
import Holidays.Base qualified as H

-- Annual holidays
annualHolidays :: H.Year -> [H.Holiday]
annualHolidays year =
  let
    newYearsDay = Holiday {day = annualHoliday year 1 1, start = H.Year 0, end = Nothing}
    humanRightsDay = Holiday {day = annualHoliday year 3 21, start = H.Year 0, end = Nothing}
    familyDay = Holiday {day = easterHoliday year, start = H.Year 0, end = Nothing}
    goodFriday = Holiday {day = addDays (-2) (day familyDay), start = H.Year 0, end = Nothing}
    freedomDay = Holiday {day = annualHoliday year 4 27, start = H.Year 0, end = Nothing}
    workersDay = Holiday {day = annualHoliday year 5 1, start = H.Year 0, end = Nothing}
    youthDay = Holiday {day = annualHoliday year 6 16, start = H.Year 0, end = Nothing}
    nationalWomensDay = Holiday {day = annualHoliday year 8 9, start = H.Year 0, end = Nothing}
    heritageDay = Holiday {day = annualHoliday year 9 24, start = H.Year 0, end = Nothing}
    dayOfReconciliation = Holiday {day = annualHoliday year 12 16, start = H.Year 0, end = Nothing}
    christmasDay = Holiday {day = annualHoliday year 12 25, start = H.Year 0, end = Nothing}
    dayOfGoodwill = Holiday {day = annualHoliday year 12 26, start = H.Year 0, end = Nothing}
    generalElections2024 = Holiday {day = fromGregorian 2024 5 29, start = H.Year 2024, end = Just (H.Year 2025)}
    hs = [newYearsDay, humanRightsDay, familyDay, goodFriday, freedomDay, workersDay, youthDay, nationalWomensDay, heritageDay, dayOfReconciliation, christmasDay, dayOfGoodwill, generalElections2024]
  in
    map H.sundayRule hs