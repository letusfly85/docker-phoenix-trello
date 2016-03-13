#!/bin/bash

export MIX_ENV=docker
cd phoenix-trello
mix ecto.create && mix ecto.migrate
mix run priv/repo/seeds.exs
mix phoenix.server
