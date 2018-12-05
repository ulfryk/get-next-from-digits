module NextFromDigits
  ( getNextFromDigits
  ) where

import Data.Maybe

import NextFromDigits.Digits

getNextFromDigits :: Int -> Maybe Int
getNextFromDigits = toNum . next . digits
