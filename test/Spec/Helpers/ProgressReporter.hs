module Spec.Helpers.ProgressReporter (runTestTTReport) where

import Control.Concurrent
import System.IO
import Test.HUnit.Base (Test, testCaseCount)
import Test.HUnit.Text
import Text.Printf

reportMsg :: Test -> String -> Bool -> Int -> IO Int
reportMsg t _ _ l = do
  printf "\r%03d / %03d (%03d%%)" l (testCaseCount t) (div (l * 100) (testCaseCount t))
  (hFlush stdout >> threadDelay 100000)
  return (l + 1)

runTestTTReport :: Test -> IO ()
runTestTTReport t = do
  putStrLn ""
  (counts, l) <- runTestText (PutText (reportMsg t) 0) t
  putStrLn "\n"
  putStrLn $ showCounts counts
  return ()
