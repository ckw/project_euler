import           Data.Digits (digits)
import           Data.Int
import           Data.List ((\\))
import           Data.Numbers.Primes (primes)

-- ./041  1.83s user 0.01s system 99% cpu 1.849 total

main :: IO ()
main = print . last . filter pandigital .  takeWhile (< 7654321) . dropWhile (< 1234567) $ primes

pandigital :: Int64 -> Bool
pandigital n = null $ digits 10 n \\ [1..7]
