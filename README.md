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
| Afghanistan AFG | ❌ |
| Åland Islands ALA | ❌ |
| Albania ALB | ❌ |
| Algeria DZA | ❌ |
| American Samoa ASM | ❌ |
| Andorra AND | ❌ |
| Angola AGO | ❌ |
| Anguilla AIA | ❌ |
| Antarctica ATA | ❌ |
| Antigua and Barbuda ATG | ❌ |
| Argentina ARG | ❌ |
| Armenia ARM | ❌ |
| Aruba ABW | ❌ |
| Australia AUS | ❌ |
| Austria AUT | ❌ |
| Azerbaijan AZE | ❌ |
| Bahamas BHS | ❌ |
| Bahrain BHR | ❌ |
| Bangladesh BGD | ❌ |
| Barbados BRB | ❌ |
| Belarus BLR | ❌ |
| Belgium BEL | ❌ |
| Belize BLZ | ❌ |
| Benin BEN | ❌ |
| Bermuda BMU | ❌ |
| Bhutan BTN | ❌ |
| Bolivia (Plurinational State of) BOL | ❌ |
| Bonaire, Sint Eustatius and Saba BES | ❌ |
| Bosnia and Herzegovina BIH | ❌ |
| Botswana BWA | ❌ |
| Bouvet Island BVT | ❌ |
| Brazil BRA | ❌ |
| British Indian Ocean Territory IOT | ❌ |
| Brunei Darussalam BRN | ❌ |
| Bulgaria BGR | ❌ |
| Burkina Faso BFA | ❌ |
| Burundi BDI | ❌ |
| Cabo Verde CPV | ❌ |
| Cambodia KHM | ❌ |
| Cameroon CMR | ❌ |
| Canada CAN | ❌ |
| Cayman Islands CAY | ❌ |
| Central African Republic CAF | ❌ |
| Chad TCD | ❌ |
| Chile CHL | ❌ |
| China CHN | ❌ |
| Christmas Island CXR | ❌ |
| Cocos (Keeling) Islands CCK | ❌ |
| Colombia COL | ❌ |
| Comoros COM | ❌ |
| Congo COG | ❌ |
| Congo, Democratic Republic of the COD | ❌ |
| Cook Islands COK | ❌ |
| Costa Rica CRI | ❌ |
| Côte d'Ivoire CIV | ❌ |
| Croatia HRV | ❌ |
| Cuba CUB | ❌ |
| Curaçao CUW | ❌ |
| Cyprus CYP | ❌ |
| Czech Republic CZE | ❌ |
| Denmark DNK | ❌ |
| Djibouti DJI | ❌ |
| Dominica DMA | ❌ |
| Dominican Republic DOM | ❌ |
| Ecuador ECU | ❌ |
| Egypt EGY | ❌ |
| El Salvador SLV | ❌ |
| Equatorial Guinea GNQ | ❌ |
| Eritrea ERI | ❌ |
| Estonia EST | ❌ |
| Eswatini SWZ | ❌ |
| Ethiopia ETH | ❌ |
| Falkland Islands (Malvinas) FLK | ❌ |
| Faroe Islands FRO | ❌ |
| Fiji FJI | ❌ |
| Finland FIN | ❌ |
| France FRA | ❌ |
| French Guiana GUF | ❌ |
| French Polynesia PYF | ❌ |
| French Southern Territories ATF | ❌ |
| Gabon GAB | ❌ |
| Gambia GMB | ❌ |
| Georgia GEO | ❌ |
| Germany DEU | ❌ |
| Ghana GHA | ❌ |
| Gibraltar GIB | ❌ |
| Greece GRC | ❌ |
| Greenland GRL | ❌ |
| Grenada GRD | ❌ |
| Guadeloupe GLP | ❌ |
| Guam GUM | ❌ |
| Guatemala GTM | ❌ |
| Guernsey GGY | ❌ |
| Guinea GIN | ❌ |
| Guinea-Bissau GNB | ❌ |
| Guyana GUY | ❌ |
| Haiti HTI | ❌ |
| Heard Island and McDonald Islands HMD | ❌ |
| Holy See (Vatican City State) VAT | ❌ |
| Honduras HND | ❌ |
| Hong Kong HKG | ❌ |
| Hungary HUN | ❌ |
| Iceland ISL | ❌ |
| India IND | ❌ |
| Indonesia IDN | ❌ |
| Iran (Islamic Republic of) IRN | ❌ |
| Iraq IRQ | ❌ |
| Ireland IRL | ❌ |
| Isle of Man IMN | ❌ |
| Israel ISR | ❌ |
| Italy ITA | ❌ |
| Jamaica JAM | ❌ |
| Japan JPN | ❌ |
| Jersey JEY | ❌ |
| Jordan JOR | ❌ |
| Kazakhstan KAZ | ❌ |
| Kenya KEN | ❌ |
| Kiribati KIR | ❌ |
| Korea (Democratic People's Republic of) PRK | ❌ |
| Korea, Republic of KOR | ❌ |
| Kuwait KWT | ❌ |
| Kyrgyzstan KGZ | ❌ |
| Lao People's Democratic Republic LAO | ❌ |
| Latvia LVA | ❌ |
| Lebanon LBN | ❌ |
| Lesotho LSO | ❌ |
| Liberia LBR | ❌ |
| Libya LBY | ❌ |
| Liechtenstein LIE | ❌ |
| Lithuania LTU | ❌ |
| Luxembourg LUX | ❌ |
| Macao MAC | ❌ |
| Madagascar MDG | ❌ |
| Malawi MWI | ❌ |
| Malaysia MYS | ❌ |
| Maldives MDV | ❌ |
| Mali MLI | ❌ |
| Malta MLT | ❌ |
| Marshall Islands MHL | ❌ |
| Martinique MTQ | ❌ |
| Mauritania MRT | ❌ |
| Mauritius MUS | ❌ |
| Mayotte MYT | ❌ |
| Mexico MEX | ❌ |
| Micronesia (Federated States of) FSM | ❌ |
| Moldova, Republic of MDA | ❌ |
| Monaco MCO | ❌ |
| Mongolia MNG | ❌ |
| Montenegro MNE | ❌ |
| Montserrat MSR | ❌ |
| Morocco MAR | ❌ |
| Mozambique MOZ | ❌ |
| Myanmar MMR | ❌ |
| Namibia NAM | ✅ |
| Nauru NRU | ❌ |
| Nepal NPL | ❌ |
| Netherlands NLD | ❌ |
| New Caledonia NCL | ❌ |
| New Zealand NZL | ❌ |
| Nicaragua NIC | ❌ |
| Niger NER | ❌ |
| Nigeria NGA | ❌ |
| Niue NIU | ❌ |
| Norfolk Island NFK | ❌ |
| North Macedonia MKD | ❌ |
| Northern Mariana Islands MNP | ❌ |
| Norway NOR | ❌ |
| Oman OMN | ❌ |
| Pakistan PAK | ❌ |
| Palau PLW | ❌ |
| Palestine, State of PSE | ❌ |
| Panama PAN | ❌ |
| Papua New Guinea PNG | ❌ |
| Paraguay PRY | ❌ |
| Peru PER | ❌ |
| Philippines PHL | ❌ |
| Pitcairn PCN | ❌ |
| Poland POL | ❌ |
| Portugal PRT | ❌ |
| Puerto Rico PRI | ❌ |
| Qatar QAT | ❌ |
| Réunion REU | ❌ |
| Romania ROU | ❌ |
| Russian Federation RUS | ❌ |
| Rwanda RWA | ❌ |
| Saint Barthélemy BLM | ❌ |
| Saint Helena, Ascension and Tristan da Cunha SHN | ❌ |
| Saint Kitts and Nevis KNA | ❌ |
| Saint Lucia LCA | ❌ |
| Saint Martin (French part) MAF | ❌ |
| Saint Pierre and Miquelon SPM | ❌ |
| Saint Vincent and the Grenadines VCT | ❌ |
| Samoa WSM | ❌ |
| San Marino SMR | ❌ |
| Sao Tome and Principe STP | ❌ |
| Saudi Arabia SAU | ❌ |
| Senegal SEN | ❌ |
| Serbia SRB | ❌ |
| Seychelles SYC | ❌ |
| Sierra Leone SLE | ❌ |
| Singapore SGP | ❌ |
| Sint Maarten (Dutch part) SXM | ❌ |
| Slovakia SVK | ❌ |
| Slovenia SVN | ❌ |
| Solomon Islands SLB | ❌ |
| Somalia SOM | ❌ |
| South Africa ZAF | ✅ |
| South Georgia and the South Sandwich Islands SGS | ❌ |
| South Sudan SSD | ❌ |
| Spain ESP | ❌ |
| Sri Lanka LKA | ❌ |
| Sudan SDN | ❌ |
| Suriname SUR | ❌ |
| Svalbard and Jan Mayen SJM | ❌ |
| Sweden SWE | ❌ |
| Switzerland CHE | ❌ |
| Syrian Arab Republic SYR | ❌ |
| Taiwan, Province of China TWN | ❌ |
| Tajikistan TJK | ❌ |
| Tanzania, United Republic of TZA | ❌ |
| Thailand THA | ❌ |
| Timor-Leste TLS | ❌ |
| Togo TGO | ❌ |
| Tokelau TKL | ❌ |
| Tonga TON | ❌ |
| Trinidad and Tobago TTO | ❌ |
| Tunisia TUN | ❌ |
| Turkey TUR | ❌ |
| Turkmenistan TKM | ❌ |
| Turks and Caicos Islands TCA | ❌ |
| Tuvalu TUV | ❌ |
| Uganda UGA | ❌ |
| Ukraine UKR | ❌ |
| United Arab Emirates ARE | ❌ |
| United Kingdom GBR | ❌ |
| United States USA | ✅ |
| United States Minor Outlying Islands UMI | ❌ |
| Uruguay URY | ❌ |
| Uzbekistan UZB | ❌ |
| Vanuatu VUT | ❌ |
| Venezuela (Bolivarian Republic of) VEN | ❌ |
| Viet Nam VNM | ❌ |
| Virgin Islands, British VGB | ❌ |
| Virgin Islands, U.S. VIR | ❌ |
| Wallis and Futuna WLF | ❌ |
| Western Sahara ESH | ❌ |
| Yemen YEM | ❌ |
| Zambia ZMB | ❌ |
| Zimbabwe ZWE | ❌ |

## TODO
- haddock
- more tests for Holidays.Base|DateFinder
- more countries