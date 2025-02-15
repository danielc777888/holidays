{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Germany (
  unitTests,
  propTests,
) where

import Data.Set qualified as S
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
        S.toAscList (holidays "DEU" regions 2025)
          @?= [ day 2025 1 1,
                day 2025 1 6,
                day 2025 3 8,
                day 2025 4 18,
                day 2025 4 20,
                day 2025 4 21,
                day 2025 5 1,
                day 2025 5 8,
                day 2025 5 29,
                day 2025 6 8,
                day 2025 6 9,
                day 2025 6 19,
                day 2025 8 15,
                day 2025 9 20,
                day 2025 10 3,
                day 2025 10 31,
                day 2025 11 1,
                day 2025 11 19,
                day 2025 12 25,
                day 2025 12 26
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "DEU" regions