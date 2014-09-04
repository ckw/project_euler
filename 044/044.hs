import           Data.Ord (comparing)
import           Data.List (minimumBy)
import qualified Data.Set as S

-- ./044  0.42s user 0.00s system 99% cpu 0.428 total

main :: IO ()
main = print . minimumBy (comparing snd) $ valids
  where valids = [ ((j,k), k - j) |
                   j <- pentagonals
                 , k <- pentagonals
                 , j < k
                 , S.member (k - j) pentagonalsS
                 , S.member (j + k) pentagonalsS
                 ]
        pentagonalsS = S.fromList pentagonals
        pentagonals = fmap penta [(1:: Int)..3000]
        penta n = n * (3 * n - 1) `div` 2
