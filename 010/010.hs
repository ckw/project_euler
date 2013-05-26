import Data.Numbers.Primes (primes)

main = print $ sum $ takeWhile (< 2000000) primes
