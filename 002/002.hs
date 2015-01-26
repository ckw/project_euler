-- ./002  0.00s user 0.00s system 74% cpu 0.005 total
main = print $ sum $ filter even $ takeWhile (<= 4000000) fibs
    where fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
