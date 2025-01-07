module Main where

import Data.Set qualified as S

import Holidays

main :: IO ()
main = do
  let hs = S.toAscList $ holidays 2024 "ZAF"
  print $ "ZAF" <> show hs
