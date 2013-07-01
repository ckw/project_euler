import Data.Numbers.Primes (isPrime)
import Data.Ord (comparing)
import Data.List (maximumBy)

main = print $ let x@((a,b), _) = maximumBy (comparing snd) quadratics
               in (x, a * b)

quadratics = do a <- [-999, -998.. 999]
                b <- [-999, -998.. 999]
                return $ ((a, b), length . takeWhile isPrime $ quadratic a b)
  where quadratic a b = let f n = n * n + a * n + b
                        in fmap f [0..]
