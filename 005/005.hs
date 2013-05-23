import Data.Numbers.Primes (primeFactors)
import Data.List
import Data.Ord (comparing)

main = print $ product
             . concat
             . fmap maximum
             . groupBy headEq
             . sortBy (comparing head)
             . concat
             . fmap (group . primeFactors)
             $ [1..20]
  where headEq a b = head a == head b
