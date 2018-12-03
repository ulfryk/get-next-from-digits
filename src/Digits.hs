module Digits
  ( Digits (Empty, Pending, Updated)
  , processD
  ) where

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

