{--
  references:
  https://en.wikipedia.org/wiki/Public_holidays_in_Germany
  https://publicholidays.de/
--}
{-# LANGUAGE OverloadedStrings #-}

module Holidays.Germany (
  holidays,
) where

import Holidays.Base
import Holidays.DateFinder
import Holidays.DateTransform

holidays :: [Region] -> (DateFinders, DateTransforms)
holidays regions =
  ( concat
      [ federalHolidays,
        regionalHolidays regions
      ],
    []
  )

federalHolidays :: DateFinders
federalHolidays =
  [ newYearsDay,
    goodFriday,
    easterMonday,
    workersDay, -- labour day
    ascensionDay,
    (50 `days`) . after . easterSunday, -- whit monday
    oct 3, -- germany unity day
    christmasDay,
    boxingDay -- second day of christmas
  ]

regionalHolidays :: [Region] -> DateFinders
regionalHolidays =
  concatMap
    ( \r -> case r of
        "BW" -> badenWurttembergHolidays
        "BY" -> bavariaHolidays
        "BE" -> berlinHolidays
        "BB" -> brandenburgHolidays
        "HB" -> bremenHolidays
        "HH" -> hamburgHolidays
        "HE" -> hesseHolidays
        "MV" -> mecklenburgVorpommernHolidays
        "NI" -> lowerSaxonyHolidays
        "NW" -> northRhineWestphaliaHolidays
        "RP" -> rhinelandPalatinateHolidays
        "SL" -> saarlandHolidays
        "SN" -> saxonyHolidays
        "ST" -> saxonyAnhaltHolidays
        "SH" -> schleswigHolsteinHolidays
        "TH" -> thuringiaHolidays
        _ -> []
    )

badenWurttembergHolidays :: DateFinders
badenWurttembergHolidays =
  [ jan 6, -- epiphany
    (60 `days`) . after . easterSunday, -- corpus christi
    nov 1 -- all saints day
  ]

bavariaHolidays :: DateFinders
bavariaHolidays =
  [ jan 6, -- epiphany
    (60 `days`) . after . easterSunday, -- corpus christi
    aug 15, -- assumption day
    nov 1 -- all saints day
  ]

berlinHolidays :: DateFinders
berlinHolidays =
  [ mar 8, -- international womens day
    nov 1, -- all saints day
    years (== 2025) . may 8 -- 80th anniversary of the end of world war 2
  ]

brandenburgHolidays :: DateFinders
brandenburgHolidays =
  [ easterSunday,
    (49 `days`) . after . easterSunday, -- whit sunday
    oct 31 -- reformation day
  ]

bremenHolidays :: DateFinders
bremenHolidays =
  [ oct 31 -- reformation day
  ]

hamburgHolidays :: DateFinders
hamburgHolidays =
  [ oct 31 -- reformation day
  ]

hesseHolidays :: DateFinders
hesseHolidays =
  [ (60 `days`) . after . easterSunday -- corpus christi
  ]

mecklenburgVorpommernHolidays :: DateFinders
mecklenburgVorpommernHolidays =
  [ mar 8, -- international womens day
    oct 31 -- reformation day
  ]

lowerSaxonyHolidays :: DateFinders
lowerSaxonyHolidays =
  [ oct 31 -- reformation day
  ]

northRhineWestphaliaHolidays :: DateFinders
northRhineWestphaliaHolidays =
  [ (60 `days`) . after . easterSunday, -- corpus christi
    nov 1 -- all saints day
  ]

rhinelandPalatinateHolidays :: DateFinders
rhinelandPalatinateHolidays =
  [ (60 `days`) . after . easterSunday, -- corpus christi
    nov 1 -- all saints day
  ]

saarlandHolidays :: DateFinders
saarlandHolidays =
  [ (60 `days`) . after . easterSunday, -- corpus christi
    aug 15, -- assumption day
    nov 1 -- all saints day
  ]

saxonyHolidays :: DateFinders
saxonyHolidays =
  [ (2 `wed`) . before . (4 `sun`) . before . christmasDay -- repentance and prayer day
  ]

saxonyAnhaltHolidays :: DateFinders
saxonyAnhaltHolidays =
  [ jan 6, -- epiphany
    oct 31 -- reformation day
  ]

schleswigHolsteinHolidays :: DateFinders
schleswigHolsteinHolidays =
  []

thuringiaHolidays :: DateFinders
thuringiaHolidays =
  [ sep 20 -- world childrens day
  ]