import Data.Numbers.Primes (isPrime)
import Data.Ord (comparing)
import Data.List (maximumBy)

main = print $ let ((a,b), len) = maximumBy (comparing snd) quadratics
               in ((a,b), len, a * b)

quadratics = do a <- [-999, -998.. 999]
                b <- [-999, -998.. 999]
                return $ ((a, b), primeSequenceLength $ quadratic a b)

quadratic a b = let f n = n * n + a * n + b
                in fmap f [0..]

primeSequenceLength = length . takeWhile isPrime
