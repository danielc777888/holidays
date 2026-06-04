{- |
This module determines public holidays based on country code and year.
-}
module Holidays (
  ISO_3166_1_Alpha_3 (..),
  Germany.GermanRegion (..),
  holidays,
  hday,
  Holiday (..),
  mkCountryCode,
)
where

import qualified Data.Set as S
import qualified Data.Text as T
import Data.Time
import Holidays.Base
import Holidays.DateTransform
import qualified Holidays.Germany as Germany
import qualified Holidays.Israel as Israel
import qualified Holidays.Mozambique as Mozambique
import qualified Holidays.Namibia as Namibia
import qualified Holidays.SouthAfrica as SouthAfrica
import qualified Holidays.UnitedKingdom as UnitedKingdom
import qualified Holidays.UnitedStates as UnitedStates

-- | 3-letter country codes.
data ISO_3166_1_Alpha_3
  = DEU (S.Set Germany.GermanRegion)
  | GBR
  | ISR
  | MOZ
  | NAM
  | USA
  | ZAF
  deriving (Show)

-- | Constructor for country code.
mkCountryCode :: T.Text -> [T.Text] -> Maybe ISO_3166_1_Alpha_3
mkCountryCode t regions =
  case t of
    "DEU" -> Just (DEU (Germany.mkGermanRegions regions))
    "GBR" -> Just GBR
    "ISR" -> Just ISR
    "MOZ" -> Just MOZ
    "NAM" -> Just NAM
    "USA" -> Just USA
    "ZAF" -> Just ZAF
    _ -> Nothing

{- |
Returns a set of public holidays based on the country code (ISO_3166_1_Alpha_3) and a specific year.
If a country is not supported an empty set is returned.
Country regions are also supported.

Examples:

@
holidays DEU (S.fromList [BW, BY ,BE]) 2025 -- Germany and various regions
holidays USA 2025
@
-}
holidays :: ISO_3166_1_Alpha_3 -> Year -> S.Set Holiday
holidays countryCode year =
  case countryCode of
    (DEU regions) -> Germany.holidays regions `apply` year
    GBR -> UnitedKingdom.holidays `apply` year
    ISR -> S.union (Israel.holidays `apply` year) (Israel.sabbaths year)
    MOZ -> Mozambique.holidays `apply` year
    NAM -> Namibia.holidays `apply` year
    USA -> UnitedStates.holidays `apply` year
    ZAF -> SouthAfrica.holidays `apply` year

-- | Applies year and date transformations to holidays
apply :: ([Year -> Holiday], [DateTransform]) -> Year -> S.Set Holiday
apply (hs, transforms) year =
  let validDays = filter (validDay . holidayValue) $ map (\d -> d year) hs -- apply year and filter out invalid days
  in  foldr (\d ds -> S.insert (foldr (\t d' -> t ds d') d transforms) ds) S.empty validDays -- apply transforms to valid days
