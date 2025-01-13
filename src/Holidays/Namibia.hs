-- reference: https://en.wikipedia.org/wiki/Public_holidays_in_Namibia

module Holidays.Namibia (
  holidays,
) where

import Data.Set qualified as S
import Data.Time

import Holidays.Base
import Holidays.Base qualified as H

{--
1 January	New Year's Day
21 March	Independence Day
variable	Good Friday	2 days before Easter Sunday
variable	Easter Monday	1 day after Easter Sunday
1 May	Workers' Day
4 May	Cassinga Day
variable	Ascension Day	39 days after Easter Sunday
25 May	Africa Day
28 May	Genocide Remembrance Day
26 August	Heroes' Day
10 December	Human Rights Day
25 December	Christmas Day
26 December	Family Day


Date	Day	Holiday
1 Jan	Mon	New Year's Day
25 Feb	Sun	Passing of Dr. Hage Geingob
21 Mar	Thu	Independence Day
29 Mar	Fri	Good Friday
1 Apr	Mon	Easter Monday
1 May	Wed	Workers' Day
4 May	Sat	Cassinga Day
9 May	Thu	Ascension Day
25 May	Sat	Africa Day
26 Aug	Mon	Heroes Day
10 Dec	Tue	Human Rights Day / Women's Day
25 Dec	Wed	Christmas Day
26 Dec	Thu	Family Day

--}

-- Annual holidays
annualHolidays :: H.Year -> [Day]
annualHolidays year =
  let
    newYearsDay = annualHoliday year 1 1
    independenceDay = annualHoliday year 3 21
    easterSunday = easterHoliday year
    goodFriday = addDays (-2) easterSunday
    easterMonday = addDays 1 easterSunday
    workersDay = annualHoliday year 5 1
    cassingaDay = annualHoliday year 5 4
    ascensionDay = addDays 39 easterSunday
    africaDay = annualHoliday year 5 25
    genocideRemembranceDay = annualHoliday year 5 28 -- start date 2025
    heroesDay = annualHoliday year 8 26
    humanRightsDay = annualHoliday year 12 10
    christmasDay = annualHoliday year 12 25
    familyDay = annualHoliday year 12 26
  in
    [newYearsDay, independenceDay, easterSunday, goodFriday, easterMonday, workersDay, cassingaDay, ascensionDay, africaDay, genocideRemembranceDay, heroesDay, humanRightsDay, christmasDay, familyDay]

-- Special days

-- General transformations
sundayRule :: Day -> Day
sundayRule day = if dayOfWeek day == Sunday then addDays 1 day else day

-- South African public holidays
holidays :: H.Year -> S.Set Day
holidays year =
  let hs =  annualHolidays year
  in S.fromList (map sundayRule hs)