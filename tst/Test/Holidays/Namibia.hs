{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Namibia (
  namUnitTests,
  namPropertyBasedTests,
) where

import Data.Set qualified as S
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

namUnitTests :: TestTree
namUnitTests =
  testGroup
    "NAM unit tests"
    [ testCase "2024" $
        S.toAscList (holidays "NAM" 2024)
          @?= [ day 2024 1 1,
                day 2024 3 21,
                day 2024 3 29,
                day 2024 4 1,
                day 2024 5 1,
                day 2024 5 4,
                day 2024 5 9,
                day 2024 5 25,
                day 2024 8 26,
                day 2024 12 10,
                day 2024 12 25,
                day 2024 12 26
              ],
      testCase "2025" $
        S.toAscList (holidays "NAM" 2025)
          @?= [ day 2025 1 1,
                day 2025 3 21,
                day 2025 4 18,
                day 2025 4 21,
                day 2025 5 1,
                day 2025 5 5,
                day 2025 5 26,
                day 2025 5 28,
                day 2025 5 29,
                day 2025 8 26,
                day 2025 12 10,
                day 2025 12 25,
                day 2025 12 26
              ]
    ]

namPropertyBasedTests :: TestTree
namPropertyBasedTests = propertyBasedTests "NAM"