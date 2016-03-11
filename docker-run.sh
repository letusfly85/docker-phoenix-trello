#!/bin/bash

export MIX_ENV=docker
mix ecto.create && mix ecto.migrate
mix run priv/repo/seeds.exs
mix phoenix.server
