{--
  references:
  https://en.wikipedia.org/wiki/Public_holidays_in_Israel
--}
module Holidays.Israel (
  holidays,
  sabbaths,
) where

import qualified Data.Set as S
import Data.Text (show)
import qualified Data.Text as T
import Data.Time
import qualified Data.Time.Calendar.Hebrew as H

import Holidays.Base

import Holidays.DateFinder
import Holidays.DateTransform

holidays :: ([Year -> Holiday], [DateTransform])
holidays =
  ( [ hday "day_of_atonement" . jewishHoliday H.Tishrei 10,
      hday "tisha_bav" . jewishHoliday H.Av 9
    ],
    []
  )

-- | Convert jewish holiday to from hebrew date to gregorian date.
jewishHoliday :: H.Month -> Int -> Year -> Day
jewishHoliday m d y =
  case ds' of
    [] -> nullDay
    (d' : _) -> d'
  where
    ds = map (\hy -> H.fromHebrew (H.HebrewDate (H.year hy) m d)) (hebrewDates y)
    ds' = filter (\d' -> let (y', _, _) = toGregorian d' in y' == y) ds -- filter with specified year

{- |
Gets hebrew dates based on Jan 1 of gregorian year.
Use year and offset by +1 and -1 to deal with year edge discrepencies when converting to hebrew dates.
-}
hebrewDates :: Year -> [H.HebrewDate]
hebrewDates y = map (\x -> H.toHebrew (fromGregorian (y + x) January 1)) [-1, 0, 1]

sabbaths :: Year -> S.Set Holiday
sabbaths = S.fromList . map (\(i, d) -> hday ("sabbath_" <> (T.show i)) d) . zip [1 ..] . filter (\d -> dayOfWeek d == Saturday) . periodAllDays
