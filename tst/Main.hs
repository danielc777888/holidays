{-# LANGUAGE OverloadedStrings #-}

module Main where

import Test.Holidays.Namibia
import Test.Holidays.SouthAfrica
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propertyBasedTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [namUnitTests, zafUnitTests]

propertyBasedTests :: TestTree
propertyBasedTests = testGroup "Holidays property based tests" [namPropertyBasedTests, zafPropertyBasedTests]