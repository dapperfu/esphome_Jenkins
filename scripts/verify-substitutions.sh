#!/bin/bash
# Verify ESPHome variable substitutions before compilation
# Usage: ./scripts/verify-substitutions.sh devices/plugs/office.yaml

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <device.yaml>"
    exit 1
fi

YAML_FILE="$1"
VENV="${VENV:-venv}"

echo "Verifying substitutions in ${YAML_FILE}..."
echo ""

# Check resolved config for AP SSID
echo "AP SSID configuration:"
${VENV}/bin/esphome config "${YAML_FILE}" 2>/dev/null | grep -A 3 "ap:" | grep "ssid:" || echo "Warning: Could not find AP SSID in resolved config"
echo ""

# Check for unresolved substitutions
if ${VENV}/bin/esphome config "${YAML_FILE}" 2>/dev/null | grep -q '\${'; then
    echo "ERROR: Unresolved substitutions found!"
    ${VENV}/bin/esphome config "${YAML_FILE}" 2>/dev/null | grep '\${'
    exit 1
else
    echo "✓ All substitutions resolved correctly"
fi

