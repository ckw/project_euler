import Data.Char (digitToInt)

-- ./034  0.53s user 0.00s system 99% cpu 0.535 tota
main = print . sum . filter curious $ [3..fac 9]
  where fac n | n < 1 = 1
              | otherwise = product [1..n]
        curious n = let sumDigFac = sum . map (fac . digitToInt) $ show n
                    in n == sumDigFac
