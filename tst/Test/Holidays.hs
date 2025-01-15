module Test.Holidays (
  propertyBasedTests,
) where

import Data.Set qualified as S
import Data.Time
import Data.Word
import Holidays qualified as H
import Test.Tasty
import Test.Tasty.QuickCheck as QC

propertyBasedTests :: H.ISO_3166_1_Alpha_3 -> TestTree
propertyBasedTests countryCode =
  let uniqueYears c y =
        S.map
          ( \h ->
              let
                (year', _, _) = toGregorian (H.day h)
              in
                fromIntegral year'
          )
          (H.holidays c (H.Year y))
  in  testGroup
        ("Holidays property based tests for country " <> show countryCode)
        [ QC.testProperty "Day always in the same year" $
            \year -> S.singleton (year :: Word16) == uniqueYears countryCode year
        ]