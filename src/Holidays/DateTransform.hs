module Holidays.DateTransform (
  substituteRule,
  sundayRule,
  DateTransforms
) where

import Data.Set qualified as S
import Data.Time
import Holidays.DateFinder


type DateTransforms = [S.Set Day -> Day -> Day]

-- general transformations
sundayRule :: S.Set Day -> Day -> Day
sundayRule _ d = if dayOfWeek d == Sunday then addDays 1 d else d -- mon after sunday

substituteRule :: S.Set Day -> Day -> Day
substituteRule = nextOpenDay [Saturday, Sunday]
