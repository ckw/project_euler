import           Data.Char (ord)

-- ./040  0.04s user 0.00s system 83% cpu 0.053 total
main :: IO ()
main = print . product . fmap (toInt . nth) $ [9, 99, 999, 9999, 99999, 999999]
  where digits = concat . fmap show $ [(1 :: Integer)..]
        nth = (digits !!)
        toInt c | c > '/', c < ':' = ord c - 48
                |otherwise = error $ "invalid character: " ++ [c]
