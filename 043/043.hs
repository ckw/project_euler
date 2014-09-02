import           Data.Digits (unDigits)
import           Data.List (permutations)

-- ./043  0.40s user 0.00s system 98% cpu 0.411 total

main :: IO ()
main = print . sum . fmap ud . filter predicate $ permutations [0..9]

predicate :: [Int] -> Bool
predicate [_,_,d3,d4,d5,d6,d7,d8,d9,da] = even d4
                                        && (d3 + d4 + d5) `mod` 3 == 0
                                        && d6 `elem` [0,5]
                                        && (ud [d5, d6, d7]) `mod` 7  == 0
                                        && (ud [d6, d7, d8]) `mod` 11 == 0
                                        && (ud [d7, d8, d9]) `mod` 13 == 0
                                        && (ud [d8, d9, da]) `mod` 17 == 0
predicate _ = error "impossible1"

ud :: [Int] -> Int
ud = unDigits 10
