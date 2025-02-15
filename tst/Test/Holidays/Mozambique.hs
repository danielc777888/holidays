{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.Mozambique (
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
    "MOZ unit tests"
    [
      testCase "2025" $
        S.toAscList (holidays "MOZ" [] 2025)
          @?= [ day 2025 1 1,
                day 2025 2 3,
                day 2025 4 7,
                day 2025 5 1,
                day 2025 6 25,
                day 2025 9 7,
                day 2025 9 25,
                day 2025 10 4,
                day 2025 12 25
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "MOZ" []
