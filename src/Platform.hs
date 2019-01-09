module Platform
  ( interpret
  ) where

import Control.Monad.Free
import System.Directory
import System.FilePath

import Domain
import Dsl

interpret :: RapidSwitchProgram a -> IO a
interpret (Pure a) = return a
interpret (Free (ScanTasks next)) = do
  tasksDir <- combine <$> getRapidSwitchHome <*> return "tasks"
  createDirectoryIfMissing True tasksDir
  taskNames <- listDirectory tasksDir
  let tasks = (\name -> Task { name = name, setupActions = [], teardownActions = [] }) <$> taskNames
  interpret $ next tasks


getRapidSwitchHome :: IO FilePath
getRapidSwitchHome = combine <$> getHomeDirectory <*> return ".rapid-switch"