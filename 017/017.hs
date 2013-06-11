import System.Environment

main = print . length . filter (not . flip elem ['-',' ']) . concat . fmap toWords $ [1..1000]

toWords n | n ==  0 = "zero"
          | n ==  1 = "one"
          | n ==  2 = "two"
          | n ==  3 = "three"
          | n ==  4 = "four"
          | n ==  5 = "five"
          | n ==  6 = "six"
          | n ==  7 = "seven"
          | n ==  8 = "eight"
          | n ==  9 = "nine"
          | n ==  10 = "ten"
          | n ==  11 = "eleven"
          | n ==  12 = "twelve"
          | n ==  13 = "thirteen"
          | n ==  14 = "fourteen"
          | n ==  15 = "fifteen"
          | n ==  18 = "eighteen"
          | n > 15 && n < 20 = (toWords (n `mod` 10)) ++ "teen"
          | n == 20 = "twenty"
          | n > 20 && n < 30 = "twenty-" ++ toWords (n `mod` 10)
          | n == 30 = "thirty"
          | n > 30 && n < 40 = "thirty-" ++ toWords (n `mod` 10)
          | n == 40 = "forty"
          | n > 40 && n < 50 = "forty-" ++ toWords (n `mod` 10)
          | n == 50 = "fifty"
          | n > 50 && n < 60 = "fifty-" ++ toWords (n `mod` 10)
          | n == 60 = "sixty"
          | n > 60 && n < 70 = "sixty-" ++ toWords (n `mod` 10)
          | n == 70 = "seventy"
          | n > 70 && n < 80 = "seventy-" ++ toWords (n `mod` 10)
          | n == 80 = "eighty"
          | n > 80 && n < 90 = "eighty-" ++ toWords (n `mod` 10)
          | n == 90 = "ninety"
          | n > 90 && n < 100 = "ninety-" ++ toWords (n `mod` 10)
          | n > 99 && n < 1000 = toWords (n `div` 100)
                              ++ " hundred "
                              ++ if (n `mod` 100 == 0)
                                  then ""
                                  else "and " ++ toWords (n `mod` 100)
          | n == 1000 = "one thousand"
          | otherwise = "too big"
