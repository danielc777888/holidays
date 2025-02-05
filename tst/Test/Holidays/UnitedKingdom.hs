{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.UnitedKingdom (
  unitTests,
  propTests,
) where

import Data.Set qualified as S
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

unitTests :: TestTree
unitTests =
  testGroup
    "GBR unit tests"
    [ testCase "2025" $
        S.toAscList (holidays "GBR" [] 2025)
          @?= [ day 2025 1 1,
                day 2025 4 18,
                day 2025 4 21,
                day 2025 5 5,
                day 2025 5 26,
                day 2025 8 25,
                day 2025 12 25,
                day 2025 12 26
              ],
      testCase "2026" $
        S.toAscList (holidays "GBR" [] 2026)
          @?= [ day 2026 1 1,
                day 2026 4 3,
                day 2026 4 6,
                day 2026 5 4,
                day 2026 5 25,
                day 2026 8 31,
                day 2026 12 25,
                day 2026 12 28
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "GBR" []