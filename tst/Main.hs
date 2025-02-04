module Main where

import Test.Holidays.Namibia
import Test.Holidays.SouthAfrica
import Test.Holidays.UnitedKingdom
import Test.Holidays.UnitedStates
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [gbrUnitTests, namUnitTests, usaUnitTests, zafUnitTests]

propTests :: TestTree
propTests = testGroup "Holidays property based tests" [gbrPropTests, namPropTests, usaPropTests, zafPropTests]