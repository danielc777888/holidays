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

import qualified Data.Set as S
import Data.Time
import Holidays.Base
import Holidays.DateTransform
import qualified Holidays.Germany as DEU
import qualified Holidays.Mozambique as MOZ
import qualified Holidays.Namibia as NAM
import qualified Holidays.SouthAfrica as ZAF
import qualified Holidays.UnitedKingdom as GBR
import qualified Holidays.UnitedStates as USA

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

