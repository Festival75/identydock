#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Runing Development Server"
  exec python "identydock.py"
elif [ "$ENV" = 'UNIT' ]; then
  echo "Runing Unit Tests"
  exec python "test.py"
else
  echo "Running Production Server"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identydock.py --callable app --stats 0.0.0.0:9191
fi
