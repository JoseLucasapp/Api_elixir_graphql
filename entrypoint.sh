#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $DATABASE_NAME"` ]]; then
  echo "Database $DATABASE_NAME does not exist. Creating..."
  createdb -E UTF8 $DATABASE_NAME -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $DATABASE_NAME created."
fi

exec mix phx.server

# Start the server.
exec mix phx.server