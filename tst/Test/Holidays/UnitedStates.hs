{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.UnitedStates (
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
    "USA unit tests"
    [ testCase "2025" $
        S.toAscList (holidays "USA" [] 2025)
          @?= [ day 2025 1 1,
                day 2025 1 20,
                day 2025 2 17,
                day 2025 5 26,
                day 2025 6 19,
                day 2025 7 4,
                day 2025 9 1,
                day 2025 10 13,
                day 2025 11 11,
                day 2025 11 27,
                day 2025 12 25
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "USA" []