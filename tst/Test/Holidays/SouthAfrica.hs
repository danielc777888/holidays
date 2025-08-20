{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.SouthAfrica (
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
    "ZAF unit tests"
    [ testCase "2024" $
        sortOn holidayValue (S.toAscList (holidays "ZAF" [] 2024))
          @?= [ hday "new_years_day" (day 2024 1 1),
                hday "human_rights_day" (day 2024 3 21),
                hday "good_friday" (day 2024 3 29),
                hday "family_day" (day 2024 4 1),
                hday "freedom_day" (day 2024 4 27),
                hday "workers_day" (day 2024 5 1),
                hday "general_elections_2024" (day 2024 5 29),
                hday "youth_day" (day 2024 6 17),
                hday "womens_day" (day 2024 8 9),
                hday "heritage_day" (day 2024 9 24),
                hday "day_of_reconciliation" (day 2024 12 16),
                hday "christmas_day" (day 2024 12 25),
                hday "day_of_goodwill" (day 2024 12 26)
              ],
      testCase "2025" $
        sortOn holidayValue (S.toList (holidays "ZAF" [] 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "human_rights_day" (day 2025 3 21),
                hday "good_friday" (day 2025 4 18),
                hday "family_day" (day 2025 4 21),
                hday "freedom_day" (day 2025 4 28),
                hday "workers_day" (day 2025 5 1),
                hday "youth_day" (day 2025 6 16),
                hday "womens_day" (day 2025 8 9),
                hday "heritage_day" (day 2025 9 24),
                hday "day_of_reconciliation" (day 2025 12 16),
                hday "christmas_day" (day 2025 12 25),
                hday "day_of_goodwill" (day 2025 12 26)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "ZAF" []

