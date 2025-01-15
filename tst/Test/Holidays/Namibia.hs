{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Namibia (
  namUnitTests,
  namPropertyBasedTests,
) where

import Data.Maybe
import Data.Set qualified as S
import Data.Time
import Holidays qualified as H
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

nam :: H.Country
nam = fromJust (H.country "NAM")

namUnitTests :: TestTree
namUnitTests =
  testGroup
    "NAM unit tests"
    [ testCase "2024" $
        S.toAscList (S.map H.day (H.holidays nam (H.Year 2024)))
          @?= [ fromGregorian 2024 1 1,
                fromGregorian 2024 3 21,
                fromGregorian 2024 3 29,
                fromGregorian 2024 4 1,
                fromGregorian 2024 5 1,
                fromGregorian 2024 5 4,
                fromGregorian 2024 5 9,
                fromGregorian 2024 5 25,
                fromGregorian 2024 8 26,
                fromGregorian 2024 12 10,
                fromGregorian 2024 12 25,
                fromGregorian 2024 12 26
              ],
      testCase "2025" $
        S.toAscList (S.map H.day (H.holidays nam (H.Year 2025)))
          @?= [ fromGregorian 2025 1 1,
                fromGregorian 2025 3 21,
                fromGregorian 2025 4 18,
                fromGregorian 2025 4 21,
                fromGregorian 2025 5 1,
                fromGregorian 2025 5 5,
                fromGregorian 2025 5 26,
                fromGregorian 2025 5 28,
                fromGregorian 2025 5 29,
                fromGregorian 2025 8 26,
                fromGregorian 2025 12 10,
                fromGregorian 2025 12 25,
                fromGregorian 2025 12 26
              ]
    ]

namPropertyBasedTests :: TestTree
namPropertyBasedTests = propertyBasedTests nam