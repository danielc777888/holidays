{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.UnitedKingdom (
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
    "GBR unit tests"
    [ testCase "2025" $
        sortOn holidayValue (S.toList (holidays "GBR" [] 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "good_friday" (day 2025 4 18),
                hday "easter_sunday" (day 2025 4 21),
                hday "early_may_bank_holiday" (day 2025 5 5),
                hday "spring_bank_holiday" (day 2025 5 26),
                hday "summer_bank_holiday" (day 2025 8 25),
                hday "christmas_day" (day 2025 12 25),
                hday "boxing_day" (day 2025 12 26)
              ],
      testCase "2026" $
        sortOn holidayValue (S.toList (holidays "GBR" [] 2026))
          @?= [ hday "new_years_day" (day 2026 1 1),
                hday "good_friday" (day 2026 4 3),
                hday "easter_sunday" (day 2026 4 6),
                hday "early_may_bank_holiday" (day 2026 5 4),
                hday "spring_bank_holiday" (day 2026 5 25),
                hday "summer_bank_holiday" (day 2026 8 31),
                hday "christmas_day" (day 2026 12 25),
                hday "boxing_day" (day 2026 12 28)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "GBR" []

