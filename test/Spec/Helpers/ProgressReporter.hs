module Spec.Helpers.ProgressReporter (runTestTTReport) where

import Test.HUnit.Base (Test)
import Test.HUnit.Text

reportMsg :: String -> Bool -> Int -> IO Int
reportMsg m p l = do
  putStrLn $ "#" ++ show (l + 1) ++ " [" ++ show p ++ "] msg: " ++ m
  return (l + 1)

reporterPutText = PutText reportMsg 0

runTestTTReport :: Test -> IO ()
runTestTTReport t = do
  (counts, l) <- runTestText reporterPutText t
  putStrLn $ "Done after " ++ show l ++ " messages"
  putStrLn $ " "
  putStrLn $ showCounts counts
  return ()
