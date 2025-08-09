#!/bin/bash
#
# This script configures ~/.bashrc to automatically start or attach to a
# tmux session named "default" upon shell startup.
#

set -euo pipefail

BASHRC_FILE="${HOME}/.bashrc"
SNIPPET_MARKER="# AUTO-START-TMUX-DEFAULT"
SNIPPET_CONTENT='
if command -v tmux &> /dev/null && [[ $- == *i* ]] && [ -z "$TMUX" ]; then
  tmux new-session -A -s default
fi
'

# Check if the marker already exists in .bashrc. If not, create the file.
if ! [ -f "${BASHRC_FILE}" ] || ! grep -qF "${SNIPPET_MARKER}" "${BASHRC_FILE}"; then
  # Append the snippet to .bashrc
  echo "Adding tmux auto-start script to ~/.bashrc."
  cat <<EOT >> "${BASHRC_FILE}"

${SNIPPET_MARKER}
${SNIPPET_CONTENT}
EOT
  echo "Successfully added tmux auto-start script."
  echo "Please run 'source ~/.bashrc' or open a new terminal to apply."
else
  echo "tmux auto-start script is already present in ~/.bashrc."
fi
