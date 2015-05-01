-- ./048  0.01s user 0.00s system 83% cpu 0.014 total
main = putStrLn . reverse . take 10 . reverse . show . sum $ [x ^ x | x <- [1..1000]]
