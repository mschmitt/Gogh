#!/usr/bin/env bash

export PROFILE_NAME="Dracula"

export COLOR_01="#21222C"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#50FA7B"           # Green (Command)
export COLOR_04="#F1FA8C"           # Yellow (Command second)
export COLOR_05="#BD93F9"           # Blue (Path)
export COLOR_06="#FF79C6"           # Magenta (Syntax var)
export COLOR_07="#8BE9FD"           # Cyan (Prompt)
export COLOR_08="#f8f8f2"           # White

export COLOR_09="#6272A4"           # Bright Black
export COLOR_10="#FF8E8E"           # Bright Red (Command error)
export COLOR_11="#69FF94"           # Bright Green (Exec)
export COLOR_12="#FFFFA5"           # Bright Yellow
export COLOR_13="#DCACFF"           # Bright Blue (Folder)
export COLOR_14="#FF92DF"           # Bright Magenta
export COLOR_15="#A4FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282A36"   # Background
export FOREGROUND_COLOR="#f8f8f2"   # Foreground (Text)

export CURSOR_COLOR="#f8f8f2" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
