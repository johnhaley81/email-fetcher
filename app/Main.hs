module Main where

import           Lib   (getEmailUids)
import           Utils ((|>))

main :: IO ()
main = do
  uids <- getEmailUids
  uids |> show |> putStrLn
