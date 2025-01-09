-- reference: https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  holidays,
) where

import Data.Set qualified as S
import Data.Time

import Holidays.Base
import Holidays.Base qualified as H

-- Annual holidays
annualHolidays :: H.Year -> [Day]
annualHolidays year =
  let
    newYearsDay = annualHoliday year 1 1
    humanRightsDay = annualHoliday year 3 21
    familyDay = easterHoliday year
    goodFriday = addDays (-2) familyDay
    freedomDay = annualHoliday year 4 27
    workersDay = annualHoliday year 5 1
    youthDay = annualHoliday year 6 16
    nationalWomensDay = annualHoliday year 8 9
    heritageDay = annualHoliday year 9 24
    dayOfReconciliation = annualHoliday year 12 16
    christmasDay = annualHoliday year 12 25
    dayOfGoodwill = annualHoliday year 12 26
  in
    [newYearsDay, humanRightsDay, familyDay, goodFriday, freedomDay, workersDay, youthDay, nationalWomensDay, heritageDay, dayOfReconciliation, christmasDay, dayOfGoodwill]

-- Special days
-- 2024
generalElections2024 :: Day
generalElections2024 = fromGregorian 2024 5 29

-- General transformations
sundayRule :: Day -> Day
sundayRule day = if dayOfWeek day == Sunday then addDays 1 day else day

-- South African public holidays
holidays :: H.Year -> S.Set Day
holidays year =
  let
    hs = case year of
      (H.Year 2024) -> generalElections2024 : annualHolidays year
      _ -> annualHolidays year
  in
    S.fromList (map sundayRule hs)