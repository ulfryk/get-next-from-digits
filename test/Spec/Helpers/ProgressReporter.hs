module Spec.Helpers.ProgressReporter (runTestTTReport) where

import Control.Concurrent
import System.IO
import Test.HUnit.Base (Test)
import Test.HUnit.Text

reportMsg :: String -> Bool -> Int -> IO Int
reportMsg m p l = do
  putStr $ "\r#" ++ show (l + 1) ++ " [" ++ show p ++ "] msg: " ++ m
  -- threadDelay 200000
  (hFlush stdout >> threadDelay 100000)
  return (l + 1)

reporterPutText = PutText reportMsg 0

runTestTTReport :: Test -> IO ()
runTestTTReport t = do
  (counts, l) <- runTestText reporterPutText t
  putStrLn $ "\rDone 100% (" ++ show (l - 1) ++ ") specs.                                              "
  putStrLn $ " "
  putStrLn $ showCounts counts
  return ()
