module Main where

import qualified Test.Holidays.Germany as DEU
import qualified Test.Holidays.Mozambique as MOZ
import qualified Test.Holidays.Namibia as NAM
import qualified Test.Holidays.SouthAfrica as ZAF
import qualified Test.Holidays.UnitedKingdom as GBR
import qualified Test.Holidays.UnitedStates as USA
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Holidays tests" [unitTests, propTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests" [DEU.unitTests, GBR.unitTests, MOZ.unitTests, NAM.unitTests, USA.unitTests, ZAF.unitTests]

propTests :: TestTree
propTests = testGroup "Holidays property based tests" [DEU.propTests, GBR.propTests, MOZ.propTests, NAM.propTests, USA.propTests, ZAF.propTests]

