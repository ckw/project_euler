import           Data.Char (ord)
import           Data.List.Split (splitOn)

-- ./042  0.00s user 0.00s system 0% cpu 0.010 total

main :: IO ()
main = do inp <- readFile "042.txt"
          let ws = fmap (tail . init) . splitOn "," $ inp
          print . length $ filter isTri ws

isTri :: [Char] -> Bool
isTri w = wordVal w `elem` tris

tris :: [Int]
tris = let cf n = n * (n + 1) `div` 2
       in take 20 $ fmap cf [1..]

wordVal :: [Char] -> Int
wordVal = sum . fmap letterVal

letterVal :: Char -> Int
letterVal c = ord c - 0x40
