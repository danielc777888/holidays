module Holidays (
  holidays,
  ISO3166Alpha3,
)
where

import Holidays.SouthAfrica qualified as ZAF

import Data.Set qualified as S
import Data.Time

type ISO3166Alpha3 = String

holidays :: Year -> ISO3166Alpha3 -> S.Set Day
holidays x y = case y of
  "ZAF" -> ZAF.holidays x
  country -> error $ "Country " <> country <> " not supported."
