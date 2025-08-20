{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Namibia (
  unitTests,
  propTests,
) where

import Data.List
import qualified Data.Set as S
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

unitTests :: TestTree
unitTests =
  testGroup
    "NAM unit tests"
    [ testCase "2024" $
        sortOn holidayValue (S.toAscList (holidays "NAM" [] 2024))
          @?= [ hday "new_years_day" (day 2024 1 1),
                hday "independence_day" (day 2024 3 21),
                hday "good_friday" (day 2024 3 29),
                hday "easter_sunday" (day 2024 4 1),
                hday "workers_day" (day 2024 5 1),
                hday "cassinga_day" (day 2024 5 4),
                hday "ascension_day" (day 2024 5 9),
                hday "africa_day" (day 2024 5 25),
                hday "heroes_day" (day 2024 8 26),
                hday "human_rights_day" (day 2024 12 10),
                hday "christmas_day" (day 2024 12 25),
                hday "family_day" (day 2024 12 26)
              ],
      testCase "2025" $
        sortOn holidayValue (S.toAscList (holidays "NAM" [] 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "independence_day" (day 2025 3 21),
                hday "good_friday" (day 2025 4 18),
                hday "easter_sunday" (day 2025 4 21),
                hday "workers_day" (day 2025 5 1),
                hday "cassinga_day" (day 2025 5 5),
                hday "africa_day" (day 2025 5 26),
                hday "genocide_remembrance_day" (day 2025 5 28),
                hday "ascension_day" (day 2025 5 29),
                hday "heroes_day" (day 2025 8 26),
                hday "human_rights_day" (day 2025 12 10),
                hday "christmas_day" (day 2025 12 25),
                hday "family_day" (day 2025 12 26)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "NAM" []

