-- references:
-- https://www.gov.za/about-sa/public-holidays
{-# LANGUAGE OverloadedStrings #-}

module Holidays.SouthAfrica (
  holidays,
) where

import Data.Time

import Data.Set qualified as S
import Holidays.Base hiding (holidays)
import Holidays.Base qualified as H

-- Annual holidays
holidays :: H.Year -> S.Set H.Holiday
holidays year =
  let
    e = easter year
    (_, fdMonth, fdDay) = toGregorian e
    (_, gfMonth, gfDay) = toGregorian (addDays (-2) e)
    hs =
      [ holiday "New Years Day" 1 1 year,
        holiday "Human Rights Day" 21 3 year,
        holiday "Family Day" fdDay fdMonth year,
        holiday "Good Friday" gfDay gfMonth year,
        holiday "Freedom Day" 27 4 year,
        holiday "Workers Day" 1 5 year,
        duration (holiday "General Elections 2024" 29 5 year) (Year 2024) (Year 2025),
        holiday "Youth Day" 16 6 year,
        holiday "National Womens Day" 9 8 year,
        holiday "Heritage Day" 24 9 year,
        holiday "Day Of Reconciliation" 16 12 year,
        holiday "Christmas Day" 25 12 year,
        holiday "Day Of Goodwill" 26 12 year
      ]
  in
    S.fromAscList (map H.sundayRule hs)