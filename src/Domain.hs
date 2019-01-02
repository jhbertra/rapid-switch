module Domain
  ( Context
  , Model
  , Task
  ) where

data Task = Task
  { command :: String
  , arguments :: [String]
  } deriving (Show, Eq)

data Context = Context
  { id :: String
  , setupTasks :: [Task]
  , teardownTasks :: [Task]
  } deriving (Show, Eq)

data Model = Model { contexts :: [Context] } deriving (Show, Eq)