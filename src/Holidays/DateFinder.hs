module Holidays.DateFinder (
  after,
  before,
  valid,
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
  easter,
  christmas,
  newYears,
  nextOpenDay,
) where

import Data.Maybe
import Data.Set qualified as S
import Data.Time

import Data.Time.Calendar.Easter
import Holidays.Base

data Direction = Past | Future

-- common dates
newYears :: Year -> Day
newYears = jan 1

easter :: Year -> Day
easter = gregorianEaster

christmas :: Year -> Day
christmas = dec 25

-- utils
nullDate :: Day
nullDate = day 0 0 0

valid :: Day -> Bool
valid = not . (nullDate ==)

days :: Integer -> (Integer -> Maybe DayOfWeek -> Day) -> Day
days n f = f n Nothing

years :: (Year -> Bool) -> Day -> Day
years f d = if f (fromIntegral y) then d else nullDate
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

-- exclusive of before day
before :: Day -> Integer -> Maybe DayOfWeek -> Day
before = timeTravel Past

-- inclusive of after day
after :: Day -> Integer -> Maybe DayOfWeek -> Day
after = timeTravel Future

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

nextOpenDay :: [DayOfWeek] -> S.Set Day -> Day -> Day
nextOpenDay ds s d
  | dayOfWeek d `elem` ds = nextOpenDay ds s (addDays 1 d)
  | S.member d s = nextOpenDay ds s (addDays 1 d)
  | otherwise = d