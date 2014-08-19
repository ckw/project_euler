import qualified Data.IntMap as M
import           Data.Ord (comparing)
import           Data.List (maximumBy)
import           Control.Monad (guard)

--BRUTE FORCE
main :: IO ()
main = print . fst . maximumBy (comparing snd) . M.toList $ counts

counts :: M.IntMap Int
counts = foldr incr M.empty (candidates 1000)
  where incr c m = case M.lookup c m of
                      Nothing -> M.insert c 1 m
                      Just i -> M.insert c (i + 1) m

candidates :: Integral b => b -> [b]
candidates n = do a <- [1..n - 2]
                  b <- [1..n - 1]
                  c <- [1..n]
                  guard (c > b)
                  guard (c > a)
                  guard (b >= a)
                  let s = a + b + c
                  guard (s < 1001)
                  guard (a * a + b * b == c * c)
                  return s
