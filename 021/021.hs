--dumb brute force
main = do print $ sum $ filter isAmicable [1..9999]

pDivisors :: Integral a => a -> [a]
pDivisors n = 1 : concat divs
    where divs = fmap (divisible n) [2 .. floor $ sqrt $ fromIntegral n]
          divisible x y = if x `mod` y == 0
                          then [y, div x y]
                          else []

isAmicable :: Int -> Bool
isAmicable n = let a = (sum $ pDivisors n)
                   b = (sum $ pDivisors a)
               in n == b && a /= b
