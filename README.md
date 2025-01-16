# Holidays
- Public holidays with Haskell.
- Because lazy programmers need holidays!

## Examples

- Get holidays for South Africa in year 2025:
```
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Holidays

main :: IO ()
main = do
  let hs = holidays "ZAF" 2025
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