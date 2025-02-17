module Holidays.DateTransform (
  substituteRule,
  sundayRule,
  DateTransform,
) where

import Data.Set qualified as S
import Data.Time
import Holidays.Base
import Holidays.DateFinder

type DateTransform = S.Set Holiday -> Holiday -> Holiday

-- | If day is on a sunday, it moves to monday
sundayRule :: DateTransform
sundayRule _ d = if dayOfWeek h == Sunday then d {holidayValue = addDays 1 h} else d -- mon after sunday
  where
    h = holidayValue d

-- | Looks for next open day (day which is not a holiday), also skipping saturday and sunday
substituteRule :: DateTransform
substituteRule = nextOpenDay [Saturday, Sunday]
