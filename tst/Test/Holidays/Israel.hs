module Test.Holidays.Israel (
  unitTests,
  propTests,
) where

import Data.List
import qualified Data.Set as S
import qualified Data.Text as T
import Holidays
import Test.Holidays
import Test.Tasty
import Test.Tasty.HUnit

unitTests :: TestTree
unitTests =
  testGroup
    "ISR unit tests"
    [ testCase "2024" $
        sortOn holidayValue (excludeSabbaths (S.toAscList (holidays "ISR" [] 2024)))
          @?= [ hday "tisha_bav" (day 2024 8 13),
                hday "day_of_atonement" (day 2024 10 12)
              ],
      testCase "2025" $
        sortOn holidayValue (excludeSabbaths (S.toList (holidays "ISR" [] 2025)))
          @?= [ hday "tisha_bav" (day 2025 8 3),
                hday "day_of_atonement" (day 2025 10 2)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests "ISR" []

excludeSabbaths :: [Holiday] -> [Holiday]
excludeSabbaths hs = filter (not . T.isPrefixOf "sabbath_" . holidayKey) hs
