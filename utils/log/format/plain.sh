#!/usr/bin/env bash

test '[post-pass:require-fn=log::_format]'
declare -gx __LOG_FORMAT="plain"
declare -gx __LOG_PENDING_PAD=0
test '[/post-pass:require-fn]'

function log::_format
{
  local ansi=$1 ; shift
  shift
  printf "\033[%sm%s\033[0m" "$ansi" "$*"
}

function log::format::log {
  echo "0"
}
function log::format::debug {
  echo "1;35"
}
function log::format::info {
  echo "1;36"
}
function log::format::ok {
  echo "1;32"
}
function log::format::warn {
  echo "1;33"
}
function log::format::err {
  echo "1;31"
}
function log::format::fatal {
  echo "1;31"
}

function log::prefix::log {
  :
}
function log::prefix::debug {
  :
}
function log::prefix::info {
  :
}
function log::prefix::ok {
  :
}
function log::prefix::warn {
  :
}
function log::prefix::err {
  :
}
function log::prefix::fatal {
  :
}
