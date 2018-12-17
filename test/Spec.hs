import Data.Maybe
import Test.HUnit.Base

import Spec.Helpers.CustomReporter
import Spec.Helpers.ProgressReporter
import Spec.NextFromDigits
import Spec.NextFromDigits.Digits

specs :: String -> Test
specs info = test $ info ~:
    [ test_NextFromDigits
    , test_digits
    , test_toNum
    , test_next
    , test_identity
    , test_identity'
    ]

main :: IO ()
main = do
    runTestTTReport $ specs "Bar specs"
    (cc, c) <- runTestC 0 $ specs "Full custom specs"
    putStrLn $ show cc
    putStrLn $ show c
    return ()
