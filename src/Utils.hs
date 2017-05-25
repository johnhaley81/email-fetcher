module Utils
  ((|>)
  ) where

(|>) :: a -> (a -> b) -> b
(|>) a f = f a
