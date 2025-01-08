module Holidays (
  holidays,
  mkCountry,
)
where

import Data.Set qualified as S
import Data.Time qualified as T
import Holidays.Base
import Holidays.SouthAfrica qualified as ZAF

-- Three-letter country codes
type ISO_3166_1_Alpha_3 = String

data Country = ZAF

mkCountry :: ISO_3166_1_Alpha_3 -> Maybe Country
mkCountry countryCode =
  case countryCode of
    "ZAF" -> Just ZAF
    _ -> Nothing

holidays :: Year -> Country -> S.Set T.Day
holidays year country =
  case country of
    ZAF -> ZAF.holidays year
