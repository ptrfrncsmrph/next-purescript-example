module Components.Page where

import Prelude
import Control.Monad.Reader (ReaderT(..))
import Effect (Effect)
import Env (Env)
import React.Basic.Hooks as React

type Component props =
  ReaderT Env Effect (props -> React.JSX)

component ::
  forall props hooks.
  String ->
  (props -> React.Render Unit hooks React.JSX) ->
  Component props
component name renderFn = ReaderT \_ -> React.component name renderFn
