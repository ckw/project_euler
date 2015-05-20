{-# LANGUAGE BangPatterns #-}

main = print . succ . length . takeWhile (< 10 ^ 999) $ fibs
  where fibs = fib' 1 1
        fib' !a b = a : fib' b (a + b)
        
