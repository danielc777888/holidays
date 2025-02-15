module Main where

import Test.Holidays.Germany qualified as DEU
import Test.Holidays.Mozambique qualified as MOZ
import Test.Holidays.Namibia qualified as NAM
import Test.Holidays.SouthAfrica qualified as ZAF
import Test.Holidays.UnitedKingdom qualified as GBR
import Test.Holidays.UnitedStates qualified as USA
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [DEU.unitTests, GBR.unitTests, MOZ.unitTests, NAM.unitTests, USA.unitTests, ZAF.unitTests]

propTests :: TestTree
propTests = testGroup "Holidays property based tests" [DEU.propTests, GBR.propTests, MOZ.propTests, NAM.propTests, USA.propTests, ZAF.propTests]