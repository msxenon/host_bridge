#!/usr/bin/env bash
# Run the local host_bridge from the repo (parent of example/) and write its URL to .host_bridge.
# Launch config uses --dart-define-from-file=build/.host_bridge so the app gets HOST_BRIDGE_URL.
# Writes PID to build/.host_bridge.pid so postDebugTask can stop host_bridge when the app exits.
set -xe
EXAMPLE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$EXAMPLE_DIR/build/.host_bridge"
PID_FILE="$EXAMPLE_DIR/build/.host_bridge.pid"
HOST_BRIDGE_DIR="$(cd "$EXAMPLE_DIR/.." && pwd)"
OUTPUT_FILE=$(mktemp)

SESSION_FILE="$EXAMPLE_DIR/build/.host_bridge_session"
cleanup() {
  rm -f "$PID_FILE" "$ENV_FILE" "$OUTPUT_FILE"
}
trap "cleanup; exit 0" EXIT INT TERM

rm -f "$SESSION_FILE"
cd "$HOST_BRIDGE_DIR"
export HOST_BRIDGE_SESSION_FILE="$SESSION_FILE"
dart run host_bridge > "$OUTPUT_FILE" 2>&1 &
DART_PID=$!
echo "$DART_PID" > "$PID_FILE"

# Wait for "Listening on" in output
while ! grep -q "Listening on" "$OUTPUT_FILE" 2>/dev/null; do
  sleep 0.1
done

# Parse URL: prefer "http://..." from output, else use 127.0.0.1 with port from "Listening on port X"
url=$(grep -oE 'http://[^:]+:[0-9]+' "$OUTPUT_FILE" | head -1)
if [[ -z "$url" ]]; then
  port=$(grep -oE 'Listening on port [0-9]+' "$OUTPUT_FILE" | grep -oE '[0-9]+' | head -1)
  [[ -n "$port" ]] && url="http://127.0.0.1:$port"
fi
[[ -n "$url" ]] && echo "HOST_BRIDGE_URL=$url" > "$ENV_FILE"

# Stream output to stdout (for the task panel)
tail -f "$OUTPUT_FILE" &
TAIL_PID=$!

# Wait for host_bridge to exit (e.g. when killed by Stop host_bridge task)
wait $DART_PID 2>/dev/null || true
kill $TAIL_PID 2>/dev/null || true
