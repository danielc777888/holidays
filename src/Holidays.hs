module Holidays (
  holidays,
  ISO3166Alpha3
)
where

import qualified Holidays.SouthAfrica as ZAF

import Data.Time
import qualified Data.Set as S

type ISO3166Alpha3 = String

holidays :: Year -> ISO3166Alpha3 -> S.Set Day
holidays x y = case y of
  "ZAF" -> ZAF.holidays x
  country -> error $ "Country " <> country <> " not supported."
