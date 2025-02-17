{-# LANGUAGE OverloadedStrings #-}

{- |
This module determines public holidays based on country code and year.
-}
module Holidays (
  ISO_3166_1_Alpha_3,
  Region,
  holidays,
  hday,
  Holiday (..),
)
where

import Data.Set qualified as S
import Data.Time
import Holidays.Base
import Holidays.DateTransform
import Holidays.Germany qualified as DEU
import Holidays.Mozambique qualified as MOZ
import Holidays.Namibia qualified as NAM
import Holidays.SouthAfrica qualified as ZAF
import Holidays.UnitedKingdom qualified as GBR
import Holidays.UnitedStates qualified as USA

{- |
Returns a set of public holidays based on the country code (ISO_3166_1_Alpha_3) and a specific year.
If a country is not supported an empty set is returned.
Country regions are also supported.

Examples:

@
holidays \"DEU\" [\"BW\",\"BY\",\"BE\"] 2025 -- Germany and various regions
holidays \"USA\" [] 2025
@
-}
holidays :: ISO_3166_1_Alpha_3 -> [Region] -> Year -> S.Set Holiday
holidays countryCode regions year =
  case countryCode of
    "DEU" -> DEU.holidays regions `apply` year
    "GBR" -> GBR.holidays `apply` year
    "MOZ" -> MOZ.holidays `apply` year
    "NAM" -> NAM.holidays `apply` year
    "USA" -> USA.holidays `apply` year
    "ZAF" -> ZAF.holidays `apply` year
    _ -> S.empty

-- | Applies year and date transformations to holidays
apply :: ([Year -> Holiday], [DateTransform]) -> Year -> S.Set Holiday
apply (hs, transforms) year =
  let validDays = filter (validDay . holidayValue) $ map (\d -> d year) hs -- apply year and filter out invalid days
  in  foldr (\d ds -> S.insert (foldr (\t d' -> t ds d') d transforms) ds) S.empty validDays -- apply transforms to valid days