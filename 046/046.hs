import qualified Data.IntMap as M
import           Data.List (sort)
import           Data.Numbers.Primes (primes)

--especially dumb brute force
-- ./046  13.66s user 0.08s system 99% cpu 13.769 total

main = print . head . sort . filter counterExample $ [9,11.. 100001]
  where primes' = M.fromList [(p, True) | p <- takeWhile (< 100000) primes]
        dubSquares = take 1000 [2 * x * x| x <- [1..]]
        primeDubSquares = M.fromList [(p + ds, True) |
                                       p  <- (M.keys primes'),
                                       ds <- dubSquares
                                     ]
        composite = not . flip M.member primes'
        primeDubSquare = flip M.member primeDubSquares
        counterExample i = composite i && (not $ primeDubSquare i)
