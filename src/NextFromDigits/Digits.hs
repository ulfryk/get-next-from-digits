module NextFromDigits.Digits
  ( Digits(..) 
  , digits
  , next
  , toNum
  ) where

import Data.Maybe
import Text.Read

data Digits = Empty | Pending [Int] | Updated [Int]
  deriving (Eq, Show)

processD :: Digits -> Int -> Digits
processD Empty n = Pending [n]
processD (Updated ks) n = Updated (n:ks)
processD (Pending (k:ks)) n
  | k > n = Updated (k:n:ks)
  | otherwise = Pending (n:k:ks)
 
digits :: Int -> Digits
digits = toDigits . toInts
  where
    toInts = map (\d -> read [d]) . show
    toDigits [] = Empty
    toDigits ds = Updated ds
 
next :: Digits -> Digits
next (Updated ds) = foldl processD Empty . reverse $ ds
next dgts = dgts

toNum :: Digits -> Maybe Int
toNum Empty = Nothing
toNum (Pending _) = Nothing
toNum (Updated ns) = readMaybe $ ns >>= show
