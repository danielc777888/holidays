module Test.Holidays (
  propertyBasedTests,
) where

import Data.List
import Data.Time
import Data.Word
import Holidays qualified as H
import Test.Tasty
import Test.Tasty.QuickCheck as QC

propertyBasedTests :: H.Country -> TestTree
propertyBasedTests country =
  let uniqueYears c y =
        nub
          ( map
              ( \h ->
                  let
                    (year', _, _) = toGregorian (H.day h)
                  in
                    fromIntegral year'
              )
              (H.holidays c (H.Year y))
          )
  in  testGroup
        ("Holidays property based tests for country " <> show country)
        [ QC.testProperty "Day always in the same year" $
            \year -> [year :: Word16] == uniqueYears country year
        ]