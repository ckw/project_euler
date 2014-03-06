import Data.List (sort, nub)

-- bounds could be tighter
-- ./032  0.23s user 0.00s system 98% cpu 0.232 total
main = print . sum . nub $ panprods
  where panprods = [x * y | x <- [1..2498], y <- [1..98], x > y, isPD x y]
        canonical = "123456789"
        isPD x y = canonical == (sort $ show (x * y) ++ show x ++ show y)
