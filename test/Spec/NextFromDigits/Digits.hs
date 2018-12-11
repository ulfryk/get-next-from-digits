module Spec.NextFromDigits.Digits (test_digits) where

import Data.Maybe
import Test.HUnit

import NextFromDigits.Digits

digits_cases = [
  (1, Updated [1]),
  (12, Updated [1, 2]),
  (123, Updated [1, 2, 3]),
  (1000, Updated [1, 0, 0, 0]),
  (99999, Updated [9, 9, 9, 9, 9])]

digits_assertCase :: (Int, Digits) -> Test
digits_assertCase (inp, exp) =
  ("digits " ++ (show inp)) ~: exp ~=? (digits inp)

test_digits = map digits_assertCase digits_cases
