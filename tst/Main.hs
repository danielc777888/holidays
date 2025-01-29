module Main where

import Test.Holidays.Namibia
import Test.Holidays.SouthAfrica
import Test.Holidays.UnitedStates
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [namUnitTests, usaUnitTests, zafUnitTests]

propTests :: TestTree
propTests = testGroup "Holidays property based tests" [countryPropTests]

countryPropTests :: TestTree
countryPropTests = testGroup "Countries property based tests" [namPropTests, usaPropTests, zafPropTests]