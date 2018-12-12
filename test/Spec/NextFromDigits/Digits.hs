module Spec.NextFromDigits.Digits 
  ( test_digits
  , test_toNum
  , test_next
  , test_identity
  , test_identity'
  ) where

import Data.Maybe
import Test.HUnit

import NextFromDigits.Digits

assertCase :: (Show a, Show b, Eq b) => String -> (a -> b) -> (a, b) -> Test
assertCase label fn (inp, exp) = 
  label ++ show inp ~: exp ~=? fn inp

assertIdentityCase :: (Show a, Eq a) => String -> (a -> a) -> a -> Test
assertIdentityCase label idFn e =
  label ++ show e ~: e ~=? idFn e

test_digits = map (assertCase "digits " digits) 
  [ (1, Updated [1])
  , (12, Updated [1, 2])
  , (123, Updated [1, 2, 3])
  , (1000, Updated [1, 0, 0, 0])
  , (99999, Updated [9, 9, 9, 9, 9])
  ]

test_toNum = map (assertCase "toNum " toNum)
  [ (Updated [1], Just 1)
  , (Updated [1, 2, 3], Just 123)
  , (Updated [12, 3, 4], Just 1234) -- should throw
  , (Pending [1], Nothing)
  , (Empty, Nothing)
  ]

test_next = map (assertCase "next " next)
  [ (Empty, Empty)
  , (Pending [4, 3], Pending [4, 3])
  , (Updated [0], Pending [0])
  , (Updated [1], Pending [1])
  , (Updated [1, 1, 1], Pending [1, 1, 1])
  , (Updated [5, 1, 1], Pending [5, 1, 1])
  , (Updated [1, 2, 3, 4], Updated [1, 2, 4, 3])
  ]

test_identity = map (assertIdentityCase "i " (\x -> (fmap digits x) >>= toNum))
  [ Just 1
  , Just 123
  , Just 1000
  , Just 9999
  ]

test_identity' = map (assertIdentityCase "identity' " (\x -> fmap digits (x >>= toNum)))
 [ Just (Updated [1])
 , Just (Updated [1, 2, 3])
 , Just (Updated [1, 0, 0, 0])
 , Just (Updated [9, 9, 9, 9])
 ]
