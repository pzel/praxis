#!/usr/bin/env runhaskell
{-
   http://programmingpraxis.com/2016/01/22/entropy/
   Shannon entropy is computed as H = -1 * sum(pi * log2(pi))
   where pi is the frequency of each symbol i in the input
-}
module Entropy where
import Data.List (group,sort)

main :: IO ()
main = interact ((++"\n") . show . measureEntropy . concat . lines)

measureEntropy :: String -> Float
measureEntropy = ((-1) *) . sum . map val . map snd . frequencies
  where val f = f * logBase 2 f

frequencies :: String -> [(Char, Float)]
frequencies s = map (\l-> (head l, ratio l)) (group (sort s))
  where ratio :: [Char] -> Float
        ratio substring  = fromIntegral (length substring) / fromIntegral (length s)
