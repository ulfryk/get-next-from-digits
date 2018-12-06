import Data.Maybe
import Test.HUnit

import NextFromDigits

import Spec.NextFromDigits.Digits

caseList = [
  (100100, Just 101000),
  (1234, Just 1243),
  (1233, Just 1323),
  (5111, Nothing),
  (3333, Nothing),
  (0, Nothing)]

case2test :: (Int, Maybe Int) -> Test
case2test (inp, exp) =
  ("(+++" ++ (show inp) ++ ")") ~: exp ~=? (getNextFromDigits inp) 

testNextFromDigits = map case2test caseList

main :: IO ()
main = do
  runTestTT $ test $ "Spec" ~: [ testNextFromDigits
                               , digitsTest 
                               ]
  return ()
