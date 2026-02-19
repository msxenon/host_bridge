#!/usr/bin/env bash
# Stop the host_bridge process started by start_host_bridge.sh.
# Called by postDebugTask when the Flutter app / debug session ends.
# Only kills host_bridge if the app actually connected (session file exists).
EXAMPLE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PID_FILE="$EXAMPLE_DIR/build/.host_bridge.pid"
ENV_FILE="$EXAMPLE_DIR/build/.host_bridge"
SESSION_FILE="$EXAMPLE_DIR/build/.host_bridge_session"

if [ ! -f "$SESSION_FILE" ]; then
  exit 0
fi

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID" 2>/dev/null || true
    # Give it a moment to shut down gracefully
    sleep 1
    kill -9 "$PID" 2>/dev/null || true
  fi
  rm -f "$PID_FILE"
fi
rm -f "$ENV_FILE" "$SESSION_FILE"
