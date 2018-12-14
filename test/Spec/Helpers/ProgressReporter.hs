module Spec.Helpers.ProgressReporter (runTestTTReport) where

import Control.Concurrent
import qualified System.Console.Terminal.Size as S
import System.IO
import Test.HUnit.Base (Test, testCaseCount)
import Test.HUnit.Text
import Text.Printf

data Bar = Bar { len :: Int, cur :: Int, tot :: Int }

percent :: Bar -> Int
percent Bar { cur = c, tot = t } = (c * 100) `div` t

doneCount :: Bar -> Int
doneCount Bar { len = l, cur = c, tot = t } = (c * l) `div` t

barT :: Bar -> String
barT b = (take dc $ repeat '=') ++ (take uc $ repeat '_')
  where
    dc = doneCount b
    uc = len b - dc

winWidth :: Maybe (S.Window Int) -> Int
winWidth (Just (S.Window _ w)) = w
winWidth _ = 50

reportMsg :: Test -> String -> Bool -> Int -> IO Int
reportMsg t _ _ l = do
  s <- S.size
  let theBar = Bar ((winWidth s) - 14) l (testCaseCount t)
  printf ("\r%03d/%03d " ++ (barT theBar) ++ "[%3d%%]") (cur theBar) (tot theBar) (percent theBar)
  (hFlush stdout >> threadDelay 350000)
  return (l + 1)

runTestTTReport :: Test -> IO ()
runTestTTReport t = do
  putStrLn ""
  (counts, l) <- runTestText (PutText (reportMsg t) 0) t
  putStrLn "\n"
  putStrLn $ showCounts counts
  return ()
