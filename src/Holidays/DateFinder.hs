module Holidays.DateFinder (
  after,
  before,
  nextOpenDay,
  days,
  years,
  sun,
  mon,
  tues,
  wed,
  thurs,
  fri,
  sat,
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec,
  easterSunday,
  easterMonday,
  goodFriday,
  christmasDay,
  boxingDay,
  newYearsDay,
  ascensionDay,
  workersDay,
) where

import Data.Maybe
import qualified Data.Set as S
import Data.Time

import Data.Time.Calendar.Easter
import Holidays.Base

data Direction = Past | Future

-- common dates
newYearsDay :: Year -> Day
newYearsDay = jan 1

easterSunday :: Year -> Day
easterSunday = gregorianEaster

easterMonday :: Year -> Day
easterMonday = addDays 1 . easterSunday

goodFriday :: Year -> Day
goodFriday = (1 `fri`) . before . easterSunday

christmasDay :: Year -> Day
christmasDay = dec 25

boxingDay :: Year -> Day
boxingDay = dec 26

ascensionDay :: Year -> Day
ascensionDay = (39 `days`) . after . easterSunday

workersDay :: Year -> Day
workersDay = may 1

days :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
days n f = f n Nothing

years :: (Year -> Bool) -> Day -> Day
years f d = if f (fromIntegral y) then d else nullDay
  where
    (y, _, _) = toGregorian d

-- months
jan :: DayOfMonth -> Year -> Day
jan d y = day y January d

feb :: DayOfMonth -> Year -> Day
feb d y = day y February d

mar :: DayOfMonth -> Year -> Day
mar d y = day y March d

apr :: DayOfMonth -> Year -> Day
apr d y = day y April d

may :: DayOfMonth -> Year -> Day
may d y = day y May d

jun :: DayOfMonth -> Year -> Day
jun d y = day y June d

jul :: DayOfMonth -> Year -> Day
jul d y = day y July d

aug :: DayOfMonth -> Year -> Day
aug d y = day y August d

sep :: DayOfMonth -> Year -> Day
sep d y = day y September d

oct :: DayOfMonth -> Year -> Day
oct d y = day y October d

nov :: DayOfMonth -> Year -> Day
nov d y = day y November d

dec :: DayOfMonth -> Year -> Day
dec d y = day y December d

-- time travel

-- | Time-travel to the past in number of days. Excludes the specified Day.
before :: Day -> Integer -> Maybe DayOfWeek -> Day
before = timeTravel Past

-- | Time-travel to the past in number of days. Includes the specified Day.
after :: Day -> Integer -> Maybe DayOfWeek -> Day
after = timeTravel Future

-- | Time-travels to the past or future by adding a number of days.
timeTravel :: Direction -> Day -> Integer -> Maybe DayOfWeek -> Day
timeTravel Past d n w
  | isNothing w = addDays (negate n) d
  | otherwise =
      let diff = fromIntegral $ if dayOfWeek d == fromJust w then 7 else dayOfWeekDiff (dayOfWeek d) (fromJust w)
      in  addDays (negate diff - ((n - 1) * 7)) d
timeTravel Future d n w
  | isNothing w = addDays n d
  | otherwise =
      let diff = fromIntegral $ dayOfWeekDiff (fromJust w) (dayOfWeek d)
      in  addDays (diff + ((n - 1) * 7)) d

-- week days
sun :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
sun n f = f n (Just Sunday)

mon :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
mon n f = f n (Just Monday)

tues :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
tues n f = f n (Just Tuesday)

wed :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
wed n f = f n (Just Wednesday)

thurs :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
thurs n f = f n (Just Thursday)

fri :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
fri n f = f n (Just Friday)

sat :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
sat n f = f n (Just Saturday)

-- | Get the next open day by skipping days which are already holidays or specified days of the week.
nextOpenDay :: [DayOfWeek] -> S.Set Holiday -> Holiday -> Holiday
nextOpenDay ds s d
  | dayOfWeek d' `elem` ds = nextOpenDay ds s (d {holidayValue = addDays 1 d'})
  | S.member d s = nextOpenDay ds s (d {holidayValue = addDays 1 d'})
  | otherwise = d
  where
    d' = holidayValue d

