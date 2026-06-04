{--
 - references:
 - https://www.timeanddate.com/holidays/israel/2024
--}
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
        sortOn holidayValue (excludeSabbaths (S.toAscList (holidays ISR [] 2024)))
          @?= [ hday "passover" (day 2024 4 23),
                hday "seventh_day_of_passover" (day 2024 4 29),
                hday "independence_day" (day 2024 5 13),
                hday "shavout" (day 2024 6 12),
                hday "tisha_bav" (day 2024 8 13),
                hday "new_year_1" (day 2024 10 3),
                hday "new_year_2" (day 2024 10 4),
                hday "day_of_atonement" (day 2024 10 12),
                hday "feast_of_tabernacles" (day 2024 10 17),
                hday "simchat_torah" (day 2024 10 24)
              ]
    ]

propTests :: TestTree
propTests = countryPropTests ISR []

excludeSabbaths :: [Holiday] -> [Holiday]
excludeSabbaths hs = filter (not . T.isPrefixOf "sabbath_" . holidayKey) hs
