import Test.HUnit
import Lib

caseList = [
  (1233, 1234),
  (0, 1)]

case2test :: (Int, Int) -> Test
case2test (inp, exp) =
  ("(+++" ++ (show inp) ++ ")") ~: exp ~=? (getNextFromDigits inp) 

main :: IO ()
main = do
  runTestTT $ test $ map case2test caseList
  return ()
