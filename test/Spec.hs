import Data.Maybe
import Test.HUnit.Base

import Spec.Helpers.ProgressReporter
import Spec.NextFromDigits
import Spec.NextFromDigits.Digits

main :: IO ()
main = runTestTTReport . test $ "Spec " ~:
  [ test_NextFromDigits
  , test_digits
  , test_toNum
  , test_next
  ]
