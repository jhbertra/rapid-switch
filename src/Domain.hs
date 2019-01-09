module Domain
  ( Task(..)
  , Model(..)
  , Action(..)
  ) where

data Action = Action
  { command :: String
  , arguments :: [String]
  } deriving (Show, Eq)

data Task = Task
  { name :: String
  , setupActions :: [Action]
  , teardownActions :: [Action]
  } deriving (Show, Eq)

data Model = Model { contexts :: [Task] } deriving (Show, Eq)