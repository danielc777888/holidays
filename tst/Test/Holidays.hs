module Test.Holidays (
  propertyBasedTests,
) where

import Data.Set qualified as S
import Data.Time
import Holidays qualified as H
import Test.Tasty
import Test.Tasty.QuickCheck as QC

propertyBasedTests :: H.ISO_3166_1_Alpha_3 -> TestTree
propertyBasedTests countryCode =
  let uniqueYears c y =
        S.map
          ( \h ->
              let
                (year', _, _) = toGregorian h
              in
                year'
          )
          (H.holidays c y)
  in  testGroup
        ("Holidays property based tests for country " <> show countryCode)
        [ QC.testProperty "Day always in the same year" $
            \year -> S.singleton year == uniqueYears countryCode year
        ]