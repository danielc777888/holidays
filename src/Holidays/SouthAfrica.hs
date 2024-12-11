-- reference: https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  holidays
) where

import qualified Data.Set as S
import Data.Time
import Data.Time.Calendar.Easter

-- Annual holidays
annualHolidays :: Year -> [Day]
annualHolidays x = let
  annualHoliday = fromGregorian x
  newYearsDay = annualHoliday 1 1
  humanRightsDay = annualHoliday 3 21
  goodFriday = addDays (-2) familyDay
  familyDay = gregorianEaster x
  freedomDay = annualHoliday 4 27
  workersDay = annualHoliday 5 1
  youthDay = annualHoliday 6 16
  nationalWomensDay = annualHoliday 8 9
  heritageDay = annualHoliday 9 24
  dayOfReconciliation = annualHoliday 12 16
  christmasDay = annualHoliday 12 25
  dayOfGoodwill = annualHoliday 12 26
  in [newYearsDay, humanRightsDay, goodFriday, familyDay, freedomDay, workersDay, youthDay, nationalWomensDay, heritageDay, dayOfReconciliation, christmasDay, dayOfGoodwill]

-- Special days
generalElections2024 :: Day
generalElections2024 = fromGregorian 2024 5 29

-- General transformations
sundayRule :: Day -> Day
sundayRule x = if (dayOfWeek x == Sunday) then addDays 1 x else x

-- South African public holidays
holidays :: Year -> S.Set Day
holidays x = S.fromList (map sundayRule hs)
  where hs = case x of
          2024 -> generalElections2024 : annualHolidays x
          _    -> annualHolidays x
