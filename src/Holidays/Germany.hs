{--
  references:
  https://en.wikipedia.org/wiki/Public_holidays_in_Germany
  https://publicholidays.de/
--}
module Holidays.Germany (
  GermanRegion (..),
  holidays,
  mkGermanRegions,
) where

import Data.Maybe
import qualified Data.Set as S
import qualified Data.Text as T
import Data.Time

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform

-- | 2-letter german region.
data GermanRegion
  = BW
  | BY
  | BE
  | BB
  | HB
  | HH
  | HE
  | MV
  | NI
  | NW
  | RP
  | SL
  | SN
  | ST
  | SH
  | TH
  deriving (Eq, Ord, Show)

mkGermanRegions :: [T.Text] -> S.Set GermanRegion
mkGermanRegions ts =
  foldr
    ( \r acc ->
        let gr = mkRegion r in if isJust gr then S.insert (fromJust gr) acc else acc
    )
    S.empty
    ts

mkRegion :: T.Text -> Maybe GermanRegion
mkRegion t =
  case t of
    "BW" -> Just BW
    "BY" -> Just BY
    "BE" -> Just BE
    "BB" -> Just BB
    "HB" -> Just HB
    "HH" -> Just HH
    "HE" -> Just HE
    "MV" -> Just MV
    "NI" -> Just NI
    "NW" -> Just NW
    "RP" -> Just RP
    "SL" -> Just SL
    "SN" -> Just SN
    "ST" -> Just ST
    "SH" -> Just SH
    "TH" -> Just TH
    _ -> Nothing

holidays :: S.Set GermanRegion -> ([Year -> Holiday], [DateTransform])
holidays regions =
  ( concat
      [ federalHolidays,
        regionalHolidays regions
      ],
    []
  )

federalHolidays :: [Year -> Holiday]
federalHolidays =
  [ hday "new_years_day" . newYearsDay,
    hday "good_friday" . goodFriday,
    hday "easter_monday" . easterMonday,
    hday "labour_day" . workersDay,
    hday "ascension_day" . ascensionDay,
    hday "whit_monday" . (50 `days`) . after . easterSunday,
    hday "germany_unity_day" . oct 3,
    hday "christmas_day" . christmasDay,
    hday "second_day_of_christmas" . boxingDay
  ]

regionalHolidays :: S.Set GermanRegion -> [Year -> Holiday]
regionalHolidays =
  concatMap
    ( \r -> case r of
        BW -> badenWurttembergHolidays
        BY -> bavariaHolidays
        BE -> berlinHolidays
        BB -> brandenburgHolidays
        HB -> bremenHolidays
        HH -> hamburgHolidays
        HE -> hesseHolidays
        MV -> mecklenburgVorpommernHolidays
        NI -> lowerSaxonyHolidays
        NW -> northRhineWestphaliaHolidays
        RP -> rhinelandPalatinateHolidays
        SL -> saarlandHolidays
        SN -> saxonyHolidays
        ST -> saxonyAnhaltHolidays
        SH -> schleswigHolsteinHolidays
        TH -> thuringiaHolidays
    )

-- common holidays
epiphany :: Year -> Holiday
epiphany = hday "epiphany" . jan 6

corpusChristi :: Year -> Holiday
corpusChristi = hday "corpus_christi" . (60 `days`) . after . easterSunday

allSaintsDay :: Year -> Holiday
allSaintsDay = hday "all_saints_day" . nov 1

assumptionDay :: Year -> Holiday
assumptionDay = hday "assumption_day" . aug 15

internationalWomensDay :: Year -> Holiday
internationalWomensDay = hday "international_womens_day" . mar 8

reformationDay :: Year -> Holiday
reformationDay = hday "reformation_day" . oct 31

badenWurttembergHolidays :: [Year -> Holiday]
badenWurttembergHolidays =
  [ epiphany,
    corpusChristi,
    allSaintsDay
  ]

bavariaHolidays :: [Year -> Holiday]
bavariaHolidays =
  [ epiphany,
    corpusChristi,
    assumptionDay,
    allSaintsDay
  ]

berlinHolidays :: [Year -> Holiday]
berlinHolidays =
  [ internationalWomensDay,
    allSaintsDay,
    hday "80th_anniversary_of_end_of_world_war_2" . years (== 2025) . may 8
  ]

brandenburgHolidays :: [Year -> Holiday]
brandenburgHolidays =
  [ hday "easter_sunday" . easterSunday,
    hday "whit_sunday" . (49 `days`) . after . easterSunday,
    reformationDay
  ]

bremenHolidays :: [Year -> Holiday]
bremenHolidays =
  [ reformationDay
  ]

hamburgHolidays :: [Year -> Holiday]
hamburgHolidays =
  [ reformationDay
  ]

hesseHolidays :: [Year -> Holiday]
hesseHolidays =
  [corpusChristi]

mecklenburgVorpommernHolidays :: [Year -> Holiday]
mecklenburgVorpommernHolidays =
  [ internationalWomensDay,
    reformationDay
  ]

lowerSaxonyHolidays :: [Year -> Holiday]
lowerSaxonyHolidays =
  [ reformationDay
  ]

northRhineWestphaliaHolidays :: [Year -> Holiday]
northRhineWestphaliaHolidays =
  [ corpusChristi,
    allSaintsDay
  ]

rhinelandPalatinateHolidays :: [Year -> Holiday]
rhinelandPalatinateHolidays =
  [ corpusChristi,
    allSaintsDay
  ]

saarlandHolidays :: [Year -> Holiday]
saarlandHolidays =
  [ corpusChristi,
    assumptionDay,
    allSaintsDay
  ]

saxonyHolidays :: [Year -> Holiday]
saxonyHolidays =
  [ hday "repentance_and_prayer_day" . (2 `wed`) . before . (4 `sun`) . before . christmasDay
  ]

saxonyAnhaltHolidays :: [Year -> Holiday]
saxonyAnhaltHolidays =
  [ epiphany,
    reformationDay
  ]

schleswigHolsteinHolidays :: [Year -> Holiday]
schleswigHolsteinHolidays =
  []

thuringiaHolidays :: [Year -> Holiday]
thuringiaHolidays =
  [ hday "worlds_children_day" . sep 20
  ]
