module Holidays (
  Country (..),
  ISO_3166_1_Alpha_3 (..),
  Holiday (..),
  Year (..),
  holidays,
  country,
)
where

import Data.Maybe
import Data.Set qualified as S
import Holidays.Base
import Holidays.Namibia
import Holidays.SouthAfrica

holidays :: Country -> Year -> S.Set Holiday
holidays c year =
  let hs = case isoCode c of
        NAM -> namHolidays year
        ZAF -> zafHolidays year
  in  filterOnDuration hs year

filterOnDuration :: S.Set Holiday -> Year -> S.Set Holiday
filterOnDuration hs year = S.filter (\h -> year >= start h && (isNothing (end h) || year < fromJust (end h))) hs
