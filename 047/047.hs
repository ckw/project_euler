import           Data.List (nub)
import           Data.Numbers.Primes (primeFactors)

--brute force
-- ./047  2.07s user 0.02s system 99% cpu 2.100 total
main = print $ startAt 646
  where findFourInARow cnt (4:4:4:4:_) = cnt
        findFourInARow cnt l = findFourInARow (succ cnt) (tail l)
        factorCount = length . nub . primeFactors
        startAt i = findFourInARow i . map factorCount $ [i..]
