#!/bin/sh

exec thumbor -k /app/the.key -p $THUMBOR_PORT -c /app/thumbor.conf

exec "$@"
