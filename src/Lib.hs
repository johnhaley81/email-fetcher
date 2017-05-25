module Lib
    ( getEmailUids
    ) where

import           Data.Text          (Text, pack)
import           Network.Connection
import           Network.IMAP
import           Network.IMAP.Types
import           Utils              ((|>))


getEmailUids :: Text -> Text -> Text -> IO CommandResult
getEmailUids userLogin password inbox = do
  let tls = TLSSettingsSimple False False False
  let params = ConnectionParams "imap.gmail.com" 993 (Just tls) Nothing
  conn <- connectServer params Nothing
  login conn userLogin password
  select conn inbox
  uidSearch conn (pack "ALL")
