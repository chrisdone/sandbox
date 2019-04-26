#!/usr/bin/env stack
-- stack --resolver lts-12.12 script

import Options.Applicative.Simple
import Data.Semigroup ((<>))

data Sample =
  Sample
    { sampleEnable :: Bool
    , sampleUrl :: String
    } deriving (Show)

main = do
  (opts, ()) <-
    simpleOptions
      "1.0"
      "Demo opts program"
      "This program demonstrates commandline options."
      (Sample
        <$> flag False True (long "enable-the-thing" <> short 'e' <> help "Enable it!")
        <*> strArgument (metavar "URLHERE" <> help "The URL"))
      empty
  print opts
