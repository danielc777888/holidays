{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Germany (
  unitTests,
  propTests,
) where

import Data.List
import qualified Data.Set as S
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

-- german states
regions :: [Region]
regions = ["BW", "BY", "BE", "BB", "HB", "HH", "HE", "MV", "NI", "NW", "RP", "SL", "SN", "ST", "SH", "TH"]

unitTests :: TestTree
unitTests =
  testGroup
    "DEU unit tests"
    [ testCase "2025" $
        sortOn holidayValue (S.toAscList (holidays "DEU" regions 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "epiphany" (day 2025 1 6),
                hday "international_womens_day" (day 2025 3 8),
                hday "good_friday" (day 2025 4 18),
                hday "easter_sunday" (day 2025 4 20),
                hday "easter_monday" (day 2025 4 21),
                hday "labour_day" (day 2025 5 1),
                hday "80th_anniversary_of_end_of_world_war_2" (day 2025 5 8),
                hday "ascension_day" (day 2025 5 29),
                hday "whit_sunday" (day 2025 6 8),
                hday "whit_monday" (day 2025 6 9),
                hday "corpus_christi" (day 2025 6 19),
                hday "assumption_day" (day 2025 8 15),
                hday "worlds_children_day" (day 2025 9 20),
                hday "germany_unity_day" (day 2025 10 3),
                hday "reformation_day" (day 2025 10 31),
                hday "all_saints_day" (day 2025 11 1),
                hday "repentance_and_prayer_day" (day 2025 11 19),
                hday "christmas_day" (day 2025 12 25),
                hday "second_day_of_christmas" (day 2025 12 26)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "DEU" regions

