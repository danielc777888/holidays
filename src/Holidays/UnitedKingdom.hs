-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_the_United_Kingdom

module Holidays.UnitedKingdom (
  gbrHolidays,
) where

import Data.Set qualified as S
import Data.Time
import Holidays.DateFinder
import Holidays.DateTransform

-- Annual holidays
gbrHolidays :: Year -> S.Set Day
gbrHolidays year =
  let
    newYearsDay = jan 1
    goodFriday = (1 `fri`) . before . easter
    easterDay = easter
    earlyMayBankHoliday = (1 `mon`) . after . may 1
    springBankHoliday = (1 `mon`) . before . jun 1
    summerBankHoliday = (1 `mon`) . before . sep 1
    boxingDay = dec 26
    hs =
      [ newYearsDay,
        goodFriday,
        easterDay,
        earlyMayBankHoliday,
        springBankHoliday,
        summerBankHoliday,
        christmas,
        boxingDay
      ]
    hs' = map (\h -> h year) hs -- apply year
  in
    foldr (\d acc -> S.insert (substituteRule acc d) acc) S.empty $ filter valid hs'