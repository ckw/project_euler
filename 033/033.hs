import Control.Monad (guard)

main = print $ let (ns, ds) = unzip fracs
               in product ds / product ns

fracs :: [(Double, Double)]
fracs = do a <- "123456789"
           b <- "123456789"
           c <- "0123456789"
           let ab = read [a,b]
               bc = read [b,c]
           guard $ a /= b
           guard $ ab < bc
           guard $ ab / bc == read [a] / read [c]
           return $ (ab, bc)
