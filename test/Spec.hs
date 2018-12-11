import Data.Maybe
import Test.HUnit.Base

import Spec.Helpers.ProgressReporter
import Spec.NextFromDigits
import Spec.NextFromDigits.Digits

specs = "Spec" ~: [ test_NextFromDigits
                  , test_digits
                  ]

main :: IO ()
main = do
  runTestTTReport . test $ specs
  return ()
