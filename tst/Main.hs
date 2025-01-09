module Main where

import Test.Holidays.SouthAfrica
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propertyBasedTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [zafUnitTests]

propertyBasedTests :: TestTree
propertyBasedTests = testGroup "Holidays property based tests" [zafPropertyBasedTests]