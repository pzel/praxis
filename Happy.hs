#!/usr/bin/env runhaskell
{--
  # http://programmingpraxis.com/2010/07/23/happy-numbers/
  # https://en.wikipedia.org/wiki/Happy_number#Overview
  $ echo '100' | ./Happy.hs
  [1,7,10,13,19,23,28,31,32,44,49,68,70,79,82,86,91,94,97,100]
--}
module Happy where

import Data.List (nub)

main :: IO ()
main = interact ((++"\n") . show . happyUpto . read)

happyUpto :: Integer -> [Integer]
happyUpto n = filter isHappy [1..n]

isHappy :: Integer -> Bool
isHappy = go []
  where go _   1 = True
        go acc i = not (isLoop acc)
                   && go (i:acc) (sumDigitSquares i)

sumDigitSquares :: Integer -> Integer
sumDigitSquares = sumSquares . digits

digits :: Integer -> [Integer]
digits = map (\c-> read [c]) . show

sumSquares :: [Integer] -> Integer
sumSquares = sum . map (^2)

isLoop :: [Integer] -> Bool
isLoop l = length l /= length (nub l)
