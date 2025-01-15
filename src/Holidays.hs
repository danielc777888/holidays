module Holidays (
  HB.Country (..),
  HB.ISO_3166_1_Alpha_3 (..),
  HB.Holiday (..),
  HB.Year (..),
  holidays,
  HB.country,
)
where

import Data.Set qualified as S
import Holidays.Base qualified as HB
import Holidays.Namibia qualified as NAM
import Holidays.SouthAfrica qualified as ZAF

holidays :: HB.Country -> HB.Year -> S.Set HB.Holiday
holidays country =
  case HB.isoCode country of
    HB.NAM -> flip HB.holidays NAM.holidays
    HB.ZAF -> flip HB.holidays ZAF.holidays
