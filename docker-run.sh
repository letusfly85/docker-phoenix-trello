#!/bin/bash

export MIX_ENV=docker
cd phoenix-trello
mix ecto.create && mix ecto.migrate
mix local.hex --force
mix run priv/repo/seeds.exs
mix deps.update ssl_verify_hostname
mix phoenix.server
