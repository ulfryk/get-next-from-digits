module Spec.Helpers.ProgressReporter (runTestTTReport) where

import Control.Concurrent
import System.IO
import Test.HUnit.Base (Test)
import Test.HUnit.Text
import Text.Printf

reportMsg :: String -> Bool -> Int -> IO Int
reportMsg m p l = do
  printf "\r#%03d [%s] msg: %s" (l + 1) (show p) m 
  (hFlush stdout >> threadDelay 100000)
  return (l + 1)

runTestTTReport :: Test -> IO ()
runTestTTReport t = do
  (counts, l) <- runTestText (PutText reportMsg 0) t
  printf "\rDone 100%% (%d) specs.                                              \n" (l - 1)
  putStrLn $ " "
  putStrLn $ showCounts counts
  return ()
