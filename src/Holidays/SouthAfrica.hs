-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_South_Africa

module Holidays.SouthAfrica (
  zafHolidays,
) where

import Data.Time

import Data.Set qualified as S
import Holidays.Base
import Holidays.Base qualified as H

-- Annual holidays
zafHolidays :: H.Year -> S.Set Day
zafHolidays year =
  let
    newYearsDay = holiday 1 1 year

    goodFriday = Holiday {day = addDays (-2) (easter year), bounds = defaultBounds}
    familyDay = Holiday {day = easter year, bounds = defaultBounds}

    humanRightsDay = holiday 21 3 year
    freedomDay = holiday 27 4 year
    workersDay = holiday 1 5 year

    generalElections2024 = boundedHoliday 29 5 year (2024, 2024)

    youthDay = holiday 16 6 year
    nationalWomensDay = holiday 9 8 year
    heritageDay = holiday 24 9 year
    dayOfReconciliation = holiday 16 12 year
    christmasDay = holiday 25 12 year
    dayOfGoodwill = holiday 26 12 year

    hs =
      [ newYearsDay,
        goodFriday,
        familyDay,
        humanRightsDay,
        freedomDay,
        workersDay,
        generalElections2024,
        youthDay,
        nationalWomensDay,
        heritageDay,
        dayOfReconciliation,
        christmasDay,
        dayOfGoodwill
      ]
  in
    narrowHolidays $ map (\h -> h {day = sundayRule (day h)}) hs