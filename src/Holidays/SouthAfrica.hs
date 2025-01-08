-- reference: https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  holidays,
) where

import Data.Set qualified as S
import Data.Time
import Data.Time.Calendar.Easter
import Holidays.Base qualified as H

-- Annual holidays

annualHolidays :: Year -> [Day]
annualHolidays year =
  let
    annualHoliday = fromGregorian year
    newYearsDay = annualHoliday 1 1
    familyDay = gregorianEaster year
    humanRightsDay = annualHoliday 3 21
    goodFriday = addDays (-2) familyDay
    freedomDay = annualHoliday 4 27
    workersDay = annualHoliday 5 1
    youthDay = annualHoliday 6 16
    nationalWomensDay = annualHoliday 8 9
    heritageDay = annualHoliday 9 24
    dayOfReconciliation = annualHoliday 12 16
    christmasDay = annualHoliday 12 25
    dayOfGoodwill = annualHoliday 12 26
   in
    [newYearsDay, humanRightsDay, goodFriday, familyDay, freedomDay, workersDay, youthDay, nationalWomensDay, heritageDay, dayOfReconciliation, christmasDay, dayOfGoodwill]

-- Special days


-- 2024
generalElections2024 :: Day
generalElections2024 = fromGregorian 2024 5 29

-- General transformations
sundayRule :: Day -> Day
sundayRule day = if dayOfWeek day == Sunday then addDays 1 day else day

-- South African public holidays
holidays :: H.Year -> S.Set Day
holidays year = S.fromList (map sundayRule hs)
  where
    year' = fromIntegral year
    hs = case year' of
      2024 -> generalElections2024 : annualHolidays year'
      _ -> annualHolidays year'
