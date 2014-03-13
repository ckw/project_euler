import           Data.Digits (digitsRev)

-- ./036  0.24s user 0.01s system 98% cpu 0.249 total

main = print . sum $ filter dblPalindrome [1,3..999999]
  where dblPalindrome :: Int -> Bool
        dblPalindrome n = let b10 = digitsRev 10 n
                              b2  = digitsRev 2 n
                          in  b10 == reverse b10 && b2 == reverse b2
