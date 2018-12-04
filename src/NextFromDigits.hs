module NextFromDigits
    ( getNextFromDigits
    ) where

import Data.Maybe
import NextFromDigits.Digits

toDigit :: Char -> Int
toDigit d = read [d]

getDigits :: Int -> [Int]
getDigits n = map toDigit . show $ n

getNewDigits :: [Int] -> Digits
getNewDigits [] = Empty
getNewDigits (n:[]) = Pending [n]
getNewDigits ns = foldl processD Empty . reverse $ ns

getNewNum :: Digits -> Maybe String 
getNewNum Empty = Nothing
getNewNum (Pending _) = Nothing
getNewNum (Updated ns) = Just (ns >>= show)

getNextFromDigits :: Int -> Maybe Int
getNextFromDigits a = (fmap (read :: String -> Int)) . getNewNum . getNewDigits . getDigits $ a
