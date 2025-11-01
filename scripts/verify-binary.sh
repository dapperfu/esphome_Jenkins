#!/bin/bash
# Verify compiled ESPHome binary for unresolved substitutions
# Usage: ./scripts/verify-binary.sh devices/plugs/office.yaml

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <device.yaml>"
    exit 1
fi

YAML_FILE="$1"
DEVICE_DIR=$(dirname "${YAML_FILE}")
DEVICE_NAME=$(basename "${YAML_FILE}" .yaml)
BINARY="${DEVICE_DIR}/.esphome/build/${DEVICE_NAME}/.pioenvs/${DEVICE_NAME}/firmware.bin"

echo "Checking compiled binary for ${YAML_FILE}..."
echo ""

if [ ! -f "${BINARY}" ]; then
    echo "ERROR: Binary not found at ${BINARY}"
    echo "Please compile first: venv/bin/esphome compile ${YAML_FILE}"
    exit 1
fi

echo "Checking strings in ${BINARY}..."
echo ""

if strings "${BINARY}" | grep -q '\${'; then
    echo "ERROR: Found unresolved substitutions in binary!"
    strings "${BINARY}" | grep '\${'
    exit 1
else
    echo "✓ No unresolved substitutions in binary"
    echo ""
    echo "AP SSID strings found:"
    strings "${BINARY}" | grep '_ap$' | head -5 || echo "  (No _ap strings found)"
fi

