import           Data.List (sort)
import           Data.Numbers.Primes (primes)

-- ./049  2.75s user 0.00s system 99% cpu 2.760 total

main = mapM_ print $ take 2 solutions

primes' = takeWhile (< 10000) . dropWhile (< 1000) $ primes

solutions = [(a,b,c) |
                a <- primes',
                b <- primes',
                c <- primes',
                a < b,
                b < c,
                b - a == c - b,
                let f = sort . show
                in  f a == f b && f b == f c
            ]
