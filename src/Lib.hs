module Lib
    ( getEmailUids
    ) where

import           Data.Text          (pack)
import           Network.Connection
import           Network.IMAP
import           Network.IMAP.Types
import           Utils              ((|>))


getEmailUids :: IO CommandResult
getEmailUids = do
  let tls = TLSSettingsSimple False False False
  let params = ConnectionParams "imap.gmail.com" 993 (Just tls) Nothing
  conn <- connectServer params Nothing
  login conn (pack "mylogin") (pack "mypass")
  select conn (pack "inbox")
  uidSearch conn (pack "ALL")
