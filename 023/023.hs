import Control.Monad  (guard)
import Data.IntSet (fromList, toList, (\\))

--2.3 seconds. meh
main = do print $ foldl1 (+) $ toList $ fromList [1..28123] \\ abundantSums

isAbundant n = n < (sum $ pDivisors n)

abundants = filter isAbundant [1..28123 :: Int]

abundantSums = fromList $ do a1 <- abundants
                             a2 <- abundants
                             guard (a1 >= a2 )
                             guard (a1 + a2 < 28124)
                             return $ a1 + a2

pDivisors :: Integral a => a -> [a]
pDivisors n = let d = concat divs
                  d' = case d of
                           (x:y:xs) -> if x == y then y:xs else d
                           z -> z
              in 1 : d'
    where divs = let r = floor $ sqrt $ fromIntegral n
                 in fmap (divisible n) [r, r - 1..2]
          divisible x y = if x `mod` y == 0
                          then [y, div x y]
                          else []

