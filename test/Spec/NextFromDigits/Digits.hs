module Spec.NextFromDigits.Digits (digitsTest) where

import Data.Maybe
import Test.HUnit

import NextFromDigits.Digits

caseList = [
  (1, Updated [1]),
  (12, Updated [1, 2]),
  (123, Updated [1, 2, 3]),
  (1000, Updated [1, 0, 0, 0]),
  (99999, Updated [9, 9, 9, 9, 9])]

testDigits :: (Int, Digits) -> Test
testDigits (inp, exp) =
  ("digits " ++ (show inp)) ~: exp ~=? (digits inp)

digitsTest = map testDigits caseList
