{-# LANGUAGE BangPatterns #-}

main = print . length . takeWhile ((< 1000) . length) . fmap show $ fibs

fibs = 1 : fib' 0 1
  where fib' !a b = let z = a + b in z : fib' b z
