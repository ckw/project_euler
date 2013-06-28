{-# LANGUAGE TupleSections #-}
import Data.Ord (comparing)
import Data.List (maximumBy)

-- .02 seconds
main = print . maximumBy (comparing (snd)) . fmap period $ filter d52 [1..1000 ]
  where d52 n = not $ divides 5 n || divides 2 n

divides n x = x `mod` n == 0

period n = (n,) . length . show . head . filter (divides n) . fmap pred $ iterate (*10) 10
