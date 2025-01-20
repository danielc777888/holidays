# Holidays
- Public holidays with Haskell.
- Because lazy programmers need holidays!
- Useful for billing systems in determining when to submit payments.
- Provides a small EDSL for finding dates.

## Examples

- Get holidays for Namibia in year 2025:
```
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Holidays

main :: IO ()
main = do
  let hs = holidays "NAM" 2025
  print hs

```
- Describing holidays:
```
newYearsDay = jan 1
independenceDay = mar 21
goodFriday = (1 `fri`) . before . easter -- 1st friday before easter
easterDay = easter
ascensionDay = (39 `days`) . after . easter
workersDay = may 1
cassingaDay = may 4
africaDay = may 25
genocideRemembranceDay = years (>= 2025) . may 28
heroesDay = aug 26
humanRightsDay = dec 10
christmasDay = christmas
familyDay = dec 26
```

## New Countries
- Create module with ISO 3166 country name. eg. SouthAfrica.hs

## Supported Countries
| Country | Implemented |
| --- | ----------- |
| Namibia NAM | &#x2705; |
| South Africa ZAF | &#x2705; |

## TODO
- haddock
- more tests for Holidays.Base|DateFinder
- more countries