import Data.Set (fromList, toList)

main = print . length . toList . fromList $ do a <- [2..100]
                                               b <- [2..100]
                                               return $ a ^ b


