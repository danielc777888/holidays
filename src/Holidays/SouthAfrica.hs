-- references:
-- https://en.wikipedia.org/wiki/Public_holidays_in_South_Africa

module Holidays.SouthAfrica (
  zafHolidays,
) where

import Data.Time

import Data.Set qualified as S
import Holidays.Base
import Holidays.DateFinder

-- Annual holidays
zafHolidays :: Year -> S.Set Day
zafHolidays year =
  let
    newYearsDay = jan 1
    goodFriday = (1 `fri`) . before . easter
    familyDay = easter
    humanRightsDay = mar 21
    freedomDay = apr 27
    workersDay = may 1
    generalElections2024 = years (== 2024) . may 29
    youthDay = jun 16
    nationalWomensDay = aug 9
    heritageDay = sep 24
    dayOfReconciliation = dec 16
    dayOfGoodwill = dec 26
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
        christmas,
        dayOfGoodwill
      ]
    hs' = map (\h -> h year) hs -- apply year
  in
    S.fromList $ map sundayRule $ filter valid hs'