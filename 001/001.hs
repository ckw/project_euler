import Data.List (union)
-- ./001  0.00s user 0.00s system 79% cpu 0.008 total
main = print $ sum $ [3,6..999] `union` [5,10..999]
