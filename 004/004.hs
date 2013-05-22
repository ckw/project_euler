import Control.Monad (guard)

main = print $ maximum $ do x <- [100..999]
                            y <- [100..999]
                            let prod = x * y
                            guard (isPalindrome $ show prod)
                            return prod
  where isPalindrome x = x == reverse x
