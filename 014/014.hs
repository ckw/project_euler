import Data.List
import Data.Ord
import qualified Data.IntMap as M

--5.8 seconds
--main = print $ maximumBy (comparing snd) $ fmap pair [1..999999]
--  where count = succ . length . takeWhile (> 1)
--        pair n = (n, count $ collatz n)
--        collatz :: Int -> [Int]
--        collatz = iterate branch
--          where branch n = if n `mod` 2 == 0
--                           then div n 2
--                           else 3 * n + 1

--1.7 seconds
main = print $ let branch :: Int -> Int -> M.IntMap Int -> Int
                   branch n count m = case M.lookup n m of
                      Just x -> x + count
                      Nothing -> if n `mod` 2 == 0
                                 then branch (div n 2) (count + 1) m
                                 else if n == 1
                                      then count + 1
                                      else branch (3 * n + 1) (count + 1) m
                   res = foldl' (\m n -> M.insert n (branch n 0 m) m)
                             M.empty [1..999999]
               in maximumBy (comparing snd) $ M.toList res
