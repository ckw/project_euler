{-# Language BangPatterns #-}
import System.Environment (getArgs)
import Data.List (nub)

main = do n <- fmap (read . head) getArgs
          print $ head $ dropWhile (\(_,d) -> d < n)
              $ fmap (\t -> (t, length . divisors $ t)) $ tris

divisors :: Integral a => a -> [a]
divisors n = 1 : n : concat divs
    where divs = fmap (divisible n) [2 .. floor $ sqrt $ fromIntegral n]
          divisible x y = case x `mod` y of
                              0 -> [x, div x y]
                              _ -> []

tris :: [Int]
tris = tri' 0 1
  where tri' !x y = let z = x + y in z : tri' z (y + 1)
