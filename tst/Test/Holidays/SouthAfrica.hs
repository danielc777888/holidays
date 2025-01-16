{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.SouthAfrica (
  zafUnitTests,
  zafPropertyBasedTests,
) where

import Data.Set qualified as S
import Data.Time
import Holidays qualified as H
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

zafUnitTests :: TestTree
zafUnitTests =
  testGroup
    "ZAF unit tests"
    [ testCase "2024" $
        S.toAscList (H.holidays "ZAF" 2024)
          @?= [ fromGregorian 2024 1 1,
                fromGregorian 2024 3 21,
                fromGregorian 2024 3 29,
                fromGregorian 2024 4 1,
                fromGregorian 2024 4 27,
                fromGregorian 2024 5 1,
                fromGregorian 2024 5 29,
                fromGregorian 2024 6 17,
                fromGregorian 2024 8 9,
                fromGregorian 2024 9 24,
                fromGregorian 2024 12 16,
                fromGregorian 2024 12 25,
                fromGregorian 2024 12 26
              ],
      testCase "2025" $
        S.toAscList (H.holidays "ZAF" 2025)
          @?= [ fromGregorian 2025 1 1,
                fromGregorian 2025 3 21,
                fromGregorian 2025 4 18,
                fromGregorian 2025 4 21,
                fromGregorian 2025 4 28,
                fromGregorian 2025 5 1,
                fromGregorian 2025 6 16,
                fromGregorian 2025 8 9,
                fromGregorian 2025 9 24,
                fromGregorian 2025 12 16,
                fromGregorian 2025 12 25,
                fromGregorian 2025 12 26
              ]
    ]

zafPropertyBasedTests :: TestTree
zafPropertyBasedTests = propertyBasedTests "ZAF"