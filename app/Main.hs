module Main where

import           Data.List
import           Data.Text          (pack)
import           Lib                (getEmailUids)
import           System.Environment
import           Utils              ((|>))

main :: IO ()
main = do
  args <- getArgs
  let (userLogin:password:inbox:restArgs) = pack <$> args
  uids <- getEmailUids userLogin password inbox
  uids |> show |> putStrLn
