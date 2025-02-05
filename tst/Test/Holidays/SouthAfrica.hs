{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.SouthAfrica (
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
    "ZAF unit tests"
    [ testCase "2024" $
        S.toAscList (holidays "ZAF" [] 2024)
          @?= [ day 2024 1 1,
                day 2024 3 21,
                day 2024 3 29,
                day 2024 4 1,
                day 2024 4 27,
                day 2024 5 1,
                day 2024 5 29,
                day 2024 6 17,
                day 2024 8 9,
                day 2024 9 24,
                day 2024 12 16,
                day 2024 12 25,
                day 2024 12 26
              ],
      testCase "2025" $
        S.toAscList (holidays "ZAF" [] 2025)
          @?= [ day 2025 1 1,
                day 2025 3 21,
                day 2025 4 18,
                day 2025 4 21,
                day 2025 4 28,
                day 2025 5 1,
                day 2025 6 16,
                day 2025 8 9,
                day 2025 9 24,
                day 2025 12 16,
                day 2025 12 25,
                day 2025 12 26
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "ZAF" []