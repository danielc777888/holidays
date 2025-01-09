module Test.Holidays (
  propertyBasedTests
 ) where

import Data.List
import Data.Set qualified as S
import Data.Time
import Data.Word
import Holidays qualified as H
import Test.Tasty
import Test.Tasty.QuickCheck as QC

propertyBasedTests :: H.Country -> TestTree
propertyBasedTests country =
  testGroup
    ("Holidays property based tests for country " <> show country)
    [ QC.testProperty "Day always in the same year" $
        \year ->
          [year :: Word16]
            == nub
              ( map
                  ( \d ->
                      let
                        (year', _, _) = toGregorian d
                      in
                        fromIntegral year'
                  )
                  (S.toAscList (H.holidays country (H.Year year)))
              )
    ]