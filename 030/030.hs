main = print $ sum $ tail $ filter is5pow [(1 :: Int).. 6 * 9 ^ 5]

is5pow n = n == (sum . fmap ((^(5::Int)) . read . return) . show $ n)
