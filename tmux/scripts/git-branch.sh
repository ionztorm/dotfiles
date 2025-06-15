#!/usr/bin/env bash
branch=$(git -C "$PWD" symbolic-ref --short HEAD 2>/dev/null)
if [ -n "$branch" ]; then
  echo "#[fg=#f47067]git: $branch"
fi
