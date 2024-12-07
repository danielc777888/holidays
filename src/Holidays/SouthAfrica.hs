-- reference: https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  holidays
) where

import Data.Time
import Data.Time.Calendar.Easter
import qualified Data.Set as S

-- Annual holidays
newYearsDay :: Year -> Day
newYearsDay x = fromGregorian x 1 1

humanRightsDay :: Year -> Day
humanRightsDay x = fromGregorian x 3 21

goodFriday :: Year -> Day
goodFriday  = addDays (-2) . familyDay

familyDay :: Year -> Day
familyDay  = gregorianEaster

freedomDay :: Year -> Day
freedomDay x = fromGregorian x 4 27

workersDay :: Year -> Day
workersDay x = fromGregorian x 5 1

youthDay :: Year -> Day
youthDay x = fromGregorian x 6 16

nationalWomensDay :: Year -> Day
nationalWomensDay x = fromGregorian x 8 9

heritageDay :: Year -> Day
heritageDay x = fromGregorian x 9 24

dayOfReconciliation :: Year -> Day
dayOfReconciliation x = fromGregorian x 12 16

christmasDay :: Year -> Day
christmasDay x = fromGregorian x 12 25

dayOfGoodwill :: Year -> Day
dayOfGoodwill x = fromGregorian x 12 26

annualHolidays :: Year -> [Day]
annualHolidays x = [
    newYearsDay x,
    humanRightsDay x,
    goodFriday x,
    familyDay x,
    freedomDay x,
    workersDay x,
    youthDay x,
    nationalWomensDay x,
    heritageDay x,
    dayOfReconciliation x,
    christmasDay x,
    dayOfGoodwill x
  ]

-- Special days
generalElections2024 :: Day
generalElections2024 = fromGregorian 2024 5 29

-- General transformations
sundayRule :: Day -> Day
sundayRule x = if isSunday x then addDays 1 x else x

-- General queries
isSunday :: Day -> Bool
isSunday x = dayOfWeek x == Sunday

-- South African public holidays
holidays :: Year -> S.Set Day
holidays x = S.fromList (map sundayRule hs)
  where hs = case x of
          2024 -> generalElections2024 : annualHolidays x
          _    -> annualHolidays x
