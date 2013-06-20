{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.List (sort)
import Data.Char (ord)


main = do names <- fmap (fmap (T.init . T.tail) . T.splitOn ",") $ T.readFile "names.txt"
          let names' = sort names
          print $ accum 1 0 . fmap textToInt $ names'

textToInt = T.foldr (\c i -> i + ord c - 64) 0

accum _ acc [] = acc
accum i acc (x:xs) = accum (i + 1) (acc + x * i) xs


