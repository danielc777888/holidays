-- reference: https://www.gov.za/about-sa/public-holidays

module Holidays.SouthAfrica (
  holidays
) where

import Data.Time

workersDay :: Year -> Day
workersDay x = fromGregorian x 5 1

sundayRule :: Day -> Day
sundayRule day = if isSunday day then addDays 1 day else day

isSunday :: Day -> Bool
isSunday day = case (dayOfWeek day) of
  Sunday -> True
  _ -> False

holidays :: Year -> [Day]
holidays x = map sundayRule [workersDay x]
