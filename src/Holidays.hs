module Holidays (
  Country (..),
  Year (..),
  holidays,
  mkCountry,
)
where

import Data.Set qualified as S
import Data.Time qualified as T
import Holidays.Base
import Holidays.Namibia qualified as NAM
import Holidays.SouthAfrica qualified as ZAF

holidays :: Country -> Year -> S.Set T.Day
holidays country =
  case country of
    NAM -> NAM.holidays
    ZAF -> ZAF.holidays
