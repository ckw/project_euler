--braindamaged solution
main = print $ largestPrimeFactor (600851475143 :: Integer)

largestPrimeFactor n = last
                     . filter (\i ->  mod n i == 0)
                     . take 10000
--                          ^^^^^ magic
                     $ primes

--could just import Data.Numbers.Primes
primes = strike [2..]
  where strike (x:xs) = x : (strike $ filter (\i -> mod i x /= 0) xs)
