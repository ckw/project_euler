import           Data.Int

-- ./045  0.00s user 0.00s system 34% cpu 0.012 total

main :: IO ()
main = print . head . dropWhile (< 40756) $ matchingTriPentaHexas

matchingTriPentaHexas :: [Int64]
matchingTriPentaHexas = mPH pentas hexas
  where pentas = nGonals 5
        hexas  = nGonals 6
        nGonals n = f 1 1
          where n' = n - 2
                f a b = b : f (a + n') (a + b + n')
        mPH p (target:h') =
            let (nextP : p') = dropWhile (< target) p
            in if nextP == target
               then target : mPH p' h'
               else mPH p' h'
        mPH _ _ = error "ran out of hexagonal numbers"
