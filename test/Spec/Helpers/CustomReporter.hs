module Spec.Helpers.CustomReporter (runTestC) where

import Test.HUnit.Base

startReporter :: ReportStart Int
startReporter s c = do
    putStrLn "========================"
    putStrLn $ "Start test (" ++ show c ++ "):"
    putStrLn $ show s
    putStrLn "========================"
    return (c + 1)

errorReporter :: ReportProblem Int
errorReporter e i s c = do
    putStrLn "========================"
    putStrLn $ "Error (" ++ show c ++ "):"
    putStrLn $ show i
    putStrLn $ show e
    putStrLn "========================"
    return (c + 1)

problemReporter :: ReportProblem Int
problemReporter e i s c = do
    putStrLn "========================"
    putStrLn $ "Problem (" ++ show c ++ "):"
    putStrLn $ show i
    putStrLn $ show e
    putStrLn "========================"
    return (c + 1)

runTestC :: Int -> Test -> IO (Counts, Int)
runTestC c t = performTest startReporter errorReporter problemReporter 0 t
