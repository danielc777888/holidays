module Holidays.DateTransform (
  substituteRule,
  sundayRule,
) where

import Data.Set qualified as S
import Data.Time
import Holidays.DateFinder

-- general transformations
sundayRule :: Day -> Day
sundayRule d = if dayOfWeek d == Sunday then addDays 1 d else d -- mon after sunday

substituteRule :: S.Set Day -> Day -> Day
substituteRule = nextOpenDay [Saturday, Sunday]
