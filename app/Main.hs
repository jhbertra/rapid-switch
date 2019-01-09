module Main where

import Domain
import Dsl
import Platform

main :: IO ()
main = interpret scanTasks >>= sequence_ . map (putStrLn . name)