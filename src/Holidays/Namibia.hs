-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_Namibia

module Holidays.Namibia (
  namHolidays,
) where

import Data.Set qualified as S
import Data.Time
import Data.Time qualified as T

import Holidays.Base
import Holidays.DateFinder

-- Namibia public holidays
namHolidays :: T.Year -> S.Set Day
namHolidays year =
  let
    newYearsDay = jan 1
    independenceDay = mar 21
    goodFriday = (1 `fri`) . before . easter -- 1st friday before easter
    ascensionDay = (39 `days`) . after . easter
    workersDay = may 1
    cassingaDay = may 4
    africaDay = may 25
    genocideRemembranceDay = years (>= 2025) . may 28
    heroesDay = aug 26
    humanRightsDay = dec 10
    familyDay = dec 26
    hs =
      [ newYearsDay,
        independenceDay,
        goodFriday,
        easter,
        ascensionDay,
        workersDay,
        cassingaDay,
        africaDay,
        genocideRemembranceDay,
        heroesDay,
        humanRightsDay,
        christmas,
        familyDay
      ]
    hs' = map (\h -> h year) hs -- apply year
  in
    S.fromList $ map sundayRule $ filter valid hs'