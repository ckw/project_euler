import Control.Monad (guard)

main = print $ do a <- [1..1000]
                  b <- [1..1000]
                  c <- [1..1000]
                  guard $ a + b + c == 1000
                  guard $ a ^ 2 + b ^ 2 == c ^ 2
                  return (a, b, c, a * b * c)
