# Holidays
- Public holidays with Haskell.
- Because lazy programmers need Holidays!

## Examples

- Get holidays for South Africa in year 2025:
```
import Holidays qualified as H

H.holidays H.ZAF (H.Year 2025)
```

## New Countries
- Create module with ISO 3166 country name. eg. SouthAfrica.hs

## Supported Countries
| Country | Implemented |
| --- | ----------- |
| Namibia NAM | &#x2705; |
| South Africa ZAF | &#x2705; |

## TODO
- new properties needed. ie. start/end dates, name, regions (areas within country eg. provinces/cities)
- edsl to easily define dates