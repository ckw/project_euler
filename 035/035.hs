import qualified Data.IntMap as M
import           Data.List (intersect)
import           Data.Maybe (isJust)
import           Data.Numbers.Primes (primes)

-- ./035  0.25s user 0.00s system 98% cpu 0.255 total

--              5      2
main = print . succ . succ . length . filter circular . M.keys $ primes'

circular :: Int -> Bool
circular n = let cs = show n
             in (null $ cs `intersect` ['0','2', '4', '5', '6', '8']) &&
                (all (isJust . flip M.lookup primes') . map read . rotations $ cs)

primes' :: M.IntMap Bool
primes' = foldr (flip M.insert True) M.empty $ takeWhile (< 1000001) primes

rotations :: [a] -> [[a]]
rotations l = take (length l - 1) . tail $ iterate rot l
  where rot [] = []
        rot (x:xs) = xs ++ [x]
