import qualified Data.IntMap as M
import           Data.Digits (digits, unDigits)
import           Data.List (tails, inits, foldl')
import           Data.Maybe (isJust)
import           Data.Numbers.Primes (primes)

-- ./037  0.26s user 0.01s system 98% cpu 0.281 total

main = print . sum . filter (>10) . filter truncatable . M.keys $ primes'

primes' :: M.IntMap Bool
primes' = foldl' (\a v -> M.insert v True a) M.empty $ takeWhile (< 1000000) primes

truncatable :: Int -> Bool
truncatable n = let digits' = digits 10 n
                    lefts   = map (unDigits 10) . tail . init . tails $ digits'
                    rights  = map (unDigits 10) . tail . init . inits $ digits'
                in all (isJust . flip M.lookup primes') $ lefts ++ rights
