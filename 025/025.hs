{-# LANGUAGE BangPatterns #-}

main = print . (+1) . length . takeWhile (< 10 ^ 999) $ fibs

fibs = 1 : fib' 0 1
  where fib' !a b = let z = a + b in z : fib' b z
