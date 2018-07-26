module Sos.FileEvent
  ( FileEvent(..)
  , fileEventPath
  , showFileEvent
  ) where

import Sos.Utils

import Data.ByteString (ByteString)
import Data.Monoid ((<>))

data FileEvent
  = FileAdded    ByteString
  | FileModified ByteString
  | FileRemoved  ByteString

fileEventPath :: FileEvent -> ByteString
fileEventPath = \case
  FileAdded    path -> path
  FileModified path -> path
  FileRemoved  path -> path

showFileEvent :: FileEvent -> String
showFileEvent = \case
  FileAdded    path -> unpackBS ("Added: "    <> path)
  FileModified path -> unpackBS ("Modified: " <> path)
  FileRemoved  path -> unpackBS ("Removed: " <> path)
