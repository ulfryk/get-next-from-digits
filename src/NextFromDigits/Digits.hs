module NextFromDigits.Digits
  ( Digits
  , nextIntDigits
  , toNum
  ) where

import Data.Maybe
import Text.Read

data Digits
  = Empty
  | Pending [Int]
  | Updated [Int]

processD :: Digits -> Int -> Digits
processD Empty n = Pending [n]
processD (Updated ks) n = Updated (n:ks)
processD (Pending (k:ks)) n
  | k > n = Updated (k:n:ks)
  | otherwise = Pending (n:k:ks)
 
getDigits :: Int -> [Int]
getDigits = map (\d -> read [d]) . show
 
getNewDigits :: [Int] -> Digits
getNewDigits [] = Empty
getNewDigits (d:[]) = Pending [d]
getNewDigits ds = foldl processD Empty . reverse $ ds
 
toNum :: Digits -> Maybe Int
toNum Empty = Nothing
toNum (Pending _) = Nothing
toNum (Updated ns) = readMaybe $ ns >>= show

nextIntDigits :: Int -> Digits
nextIntDigits = getNewDigits . getDigits
