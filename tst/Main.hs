module Main where

import Data.List
import Data.Set qualified as S
import Data.Time
import Holidays qualified as H
import Test.Tasty
import Test.Tasty.HUnit

import Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holiday Tests" [zafUnitTests]

zafUnitTests =
  testGroup
    "ZAF Unit tests"
    [ testCase "2024" $
        S.toAscList (maybe S.empty (H.holidays (H.Year 2024)) (H.mkCountry "ZAF"))
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
        S.toAscList (maybe S.empty (H.holidays (H.Year 2025)) (H.mkCountry "ZAF"))
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

unitTests =
  testGroup
    "Unit tests"
    [ testCase "List comparison (different length)" $
        [1, 2, 3] `compare` [1, 2] @?= GT,
      -- the following test does not hold
      testCase "List comparison (same length)" $
        [1, 2, 3] `compare` [1, 2, 2] @?= LT
    ]

propertyBasedTests =
  testGroup
    "(checked by QuickCheck)"
    [ QC.testProperty "sort == sort . reverse" $
        \list -> sort (list :: [Int]) == sort (reverse list),
      QC.testProperty "Fermat's little theorem" $
        \x -> ((x :: Integer) ^ 7 - x) `mod` 7 == 0,
      -- the following property does not hold
      QC.testProperty "Fermat's last theorem" $
        \x y z n ->
          (n :: Integer) >= 3 QC.==> x ^ n + y ^ n /= (z ^ n :: Integer)
    ]