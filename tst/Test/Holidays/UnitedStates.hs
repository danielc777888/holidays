{-# LANGUAGE OverloadedStrings #-}

module Test.Holidays.UnitedStates (
  unitTests,
  propTests,
) where

import Data.List
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
        sortOn holidayValue (S.toAscList (holidays "USA" [] 2025))
          @?= [ hday "new_years_day" (day 2025 1 1),
                hday "martin_luther_kings_birthday" (day 2025 1 20),
                hday "george_washingtons_birthday" (day 2025 2 17),
                hday "memorial_day" (day 2025 5 26),
                hday "juneteenth_independence_day" (day 2025 6 19),
                hday "independence_day" (day 2025 7 4),
                hday "labor_day" (day 2025 9 1),
                hday "columbus_day" (day 2025 10 13),
                hday "veterans_day" (day 2025 11 11),
                hday "thanksgiving_day" (day 2025 11 27),
                hday "christmas_day" (day 2025 12 25)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "USA" []