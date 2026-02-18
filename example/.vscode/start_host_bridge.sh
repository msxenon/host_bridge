#!/usr/bin/env bash
# Run the local host_bridge from the repo (parent of example/) and write its URL to .host_bridge.
# Launch config uses --dart-define-from-file=.host_bridge so the app gets HOST_BRIDGE_URL.
set -e
EXAMPLE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$EXAMPLE_DIR/.host_bridge"
HOST_BRIDGE_DIR="$(cd "$EXAMPLE_DIR/.." && pwd)"
(cd "$HOST_BRIDGE_DIR" && dart run host_bridge) 2>&1 | while IFS= read -r line; do
  echo "$line"
  if [[ "$line" == *"Listening on"* ]] && [[ "$line" =~ (http://[^:]+:[0-9]+) ]]; then
    echo "HOST_BRIDGE_URL=${BASH_REMATCH[1]}" > "$ENV_FILE"
  fi
done
BRIDGE_EXIT="${PIPESTATUS[0]:-0}"
if [ "$BRIDGE_EXIT" -ne 0 ]; then
  rm -f "$ENV_FILE"
fi
exit "$BRIDGE_EXIT"
