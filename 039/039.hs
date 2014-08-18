import qualified Data.IntMap as M
import           Data.Ord (comparing)
import           Data.List (maximumBy)
import           Control.Monad (guard)

--BRUTE FORCE
main :: IO ()
main = print $ maximumBy (comparing snd) $ M.toList counts

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
                  guard (b > a)
                  guard (a + b + c < 1001)
                  guard (abs (sqrt' (a ^ 2 + b ^ 2) - sqrt' (c ^ 2)) < eps)
                  return (a + b + c)
  where sqrt' = sqrt . fromIntegral
        eps = 0.001 :: Double
