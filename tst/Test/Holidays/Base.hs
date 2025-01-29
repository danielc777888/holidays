module Test.Holidays.Base (
  basePropTests,
) where

import Data.Set qualified as S
import Data.Time
import Holidays
import Test.Tasty
import Test.Tasty.QuickCheck as QC

basePropTests ::  TestTree
basePropTests =
  let mkDate y m d = fromGregorian y m d
  in
    testGroup
          ("sundayRule property based tests")
          [ QC.testProperty "Always returns a Monday" $
              \y m d -> Monday == dayOfWeek (sundayRule (mkDate y m d))
          ]