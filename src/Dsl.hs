{-# LANGUAGE DeriveFunctor #-}

module Dsl
  ( RapidSwitchInstruction(..)
  , RapidSwitchProgram
  , scanTasks
  ) where

import Control.Monad.Free (Free, liftF)

import Domain (Task)

data RapidSwitchInstruction next
  = ScanTasks ([Task] -> next)
  deriving (Functor)

type RapidSwitchProgram = Free RapidSwitchInstruction

scanTasks :: RapidSwitchProgram [Task]
scanTasks = liftF $ ScanTasks id