module Holidays (
  holidays,
  ISO3166Alpha3
)
where

import qualified Holidays.SouthAfrica as ZAF
import Data.Time

type ISO3166Alpha3 = String

holidays :: Year -> ISO3166Alpha3 -> [Day]
holidays year = \case
  "ZAF" -> ZAF.holidays year
  country -> error $ "Country " <> country <> " not supported."
