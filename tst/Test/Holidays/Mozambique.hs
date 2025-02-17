{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Mozambique (
  unitTests,
  propTests,
) where

import Data.List
import Data.Set qualified as S
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

unitTests :: TestTree
unitTests =
  testGroup
    "MOZ unit tests"
    [ testCase "2025" $
        sortOn holidayValue (S.toList (holidays "MOZ" [] 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "heroes_day" (day 2025 2 3),
                hday "womens_day" (day 2025 4 7),
                hday "workers_day" (day 2025 5 1),
                hday "independence_day" (day 2025 6 25),
                hday "victory_day" (day 2025 9 7),
                hday "armed_forces_day" (day 2025 9 25),
                hday "day_of_peace_and_reconciliation" (day 2025 10 4),
                hday "family_day" (day 2025 12 25)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "MOZ" []

{-
 ( [ hday "new_years_day" . newYearsDay,
      hday "heroes_day" . feb 3,
      hday "womens_day" . apr 7,
      hday "workers_day" . workersDay,
      hday "independence_day" . jun 25,
      hday "victory_day" . sep 7,
      hday "armed_forces_day" . sep 25,
      hday "day_of_peace_and_reconciliation" . oct 4,
      hday "family_day" . christmasDay -}