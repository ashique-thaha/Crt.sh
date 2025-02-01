#!/bin/bash

# Usage function
usage() {
    echo "Usage: $0 input_file output_file [-v]"
    echo "Extract unique domain names from crt.sh JSON output."
    echo "-v  Enable verbose mode to see extraction details."
    exit 1
}

# Check arguments
if [ $# -lt 2 ]; then
    usage
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"
VERBOSE=false

# Enable verbose mode if -v flag is present
if [ "$3" == "-v" ]; then
    VERBOSE=true
fi

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found!"
    exit 1
fi

# Extract and deduplicate domain names
if $VERBOSE; then
    echo "[*] Extracting domain names from '$INPUT_FILE'..."
fi

# Use jq to parse JSON and extract domain names
DOMAINS=$(jq -r '.. | objects | .name_value? // empty' "$INPUT_FILE" | grep -E '^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' | sort | uniq)

# Save output
echo "$DOMAINS" > "$OUTPUT_FILE"

if $VERBOSE; then
    echo "[*] Unique domain names saved to '$OUTPUT_FILE'."
    echo "---- Extracted Domains ----"
    echo "$DOMAINS"
    echo "---------------------------"
fi

echo "Extraction complete."
