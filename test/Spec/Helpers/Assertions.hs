module Spec.Helpers.Assertions
  ( assertCase
  , assertIdentityCase
  ) where

import Test.HUnit

assertCase :: (Show a, Show b, Eq b) => String -> (a -> b) -> (a, b) -> Test
assertCase label fn (inp, exp) =
  label ++ show inp ~: exp ~=? fn inp

assertIdentityCase :: (Show a, Eq a) => String -> (a -> a) -> a -> Test
assertIdentityCase label idFn e =
  label ++ show e ~: e ~=? idFn e
