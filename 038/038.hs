import           Data.Digits (digits, unDigits)
import           Data.List ((\\))
import           Data.Maybe (catMaybes)

-- ./038  0.00s user 0.00s system 52% cpu 0.008 total

main :: IO ()
main = print . head . catMaybes . fmap pandigital $ [9876, 9875..9123]

pandigital :: Int -> Maybe Int
pandigital n = let a = digits 10 n
                   b = digits 10 (2 * n)
                   c = (a ++ b)
               in if  c \\ [1..9] == []
                  then Just $ unDigits 10 c
                  else Nothing
