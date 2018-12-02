module Main where

import Lib
import Text.Read

main :: IO ()
main = do
  putStrLn "-------------------------------------------"
  putStrLn "Get next number made of given number digits"
  putStrLn "Please enter integer:"
  l <- getLine
  case (readMaybe l :: Maybe Int) of
    Just n -> putStrLn . show . getNextFromDigits $ n
    Nothing -> putStrLn " - given input is not an integer :/"
  main
