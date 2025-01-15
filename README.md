# Holidays
- Public holidays with Haskell.
- Because lazy programmers need Holidays!

## Examples

- Get holidays for South Africa in year 2025:
```
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Set qualified as S
import Holidays qualified as H

main :: IO ()
main = do
  let zaf = H.country "ZAF"
  let hs = maybe S.empty (`H.holidays` H.Year 2025) zaf
  print hs

```

## New Countries
- Create module with ISO 3166 country name. eg. SouthAfrica.hs

## Supported Countries
| Country | Implemented |
| --- | ----------- |
| Namibia NAM | &#x2705; |
| South Africa ZAF | &#x2705; |

## TODO
- edsl to easily define dates