#!/bin/bash
# entrypoint.sh

# PIDファイルが存在すれば削除する
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

# 元のエントリポイントコマンドを実行する
exec "$@"
