module Holidays (
  HB.Country (..),
  HB.Holiday (..),
  HB.Year (..),
  holidays,
  HB.mkCountry,
)
where

import Holidays.Base qualified as HB
import Holidays.Namibia qualified as NAM
import Holidays.SouthAfrica qualified as ZAF

holidays :: HB.Country -> HB.Year -> [HB.Holiday]
holidays country =
  case country of
    HB.NAM -> flip HB.holidays NAM.annualHolidays
    HB.ZAF -> flip HB.holidays ZAF.annualHolidays
