#!/bin/bash

# Function to display the options and return selected options
show_menu() {
  # Save terminal settings
  local old_stty=$(stty -g)
  stty -icanon -echo min 1 time 0
  
  # Save cursor position
  echo -en "\033[s"
  
  local options=($(printf "%s\n" "$@"))
  local selected=()
  local cursor=0
  local esc=$(printf '\033')

  while true; do
    # This command clears the entire screen and moves the cursor to the top-left 
    # corner. The >&2 redirects the output to stderr.
    tput clear >&2
    echo "Use UP/DOWN to move, SPACE to select, and ENTER to confirm your choices." >&2

    for i in "${!options[@]}"; do
      if [ "$i" -eq "$cursor" ]; then
        printf "(*) %s\n" "${options[$i]}" >&2
      else
        printf "( ) %s\n" "${options[$i]}" >&2
      fi
    done

    # Reading the user input
    IFS= read -rsn1 input
  
    if [[ "$input" == "$esc" ]]; then
      IFS= read -rsn2 input

      if [[ "$input" == "[A" ]]; then
        cursor=$(((cursor - 1 + ${#options[@]}) % ${#options[@]}))
      elif [[ "$input" == "[B" ]]; then
        cursor=$(((cursor + 1) % ${#options[@]}))
      fi

      selected=("${options[$cursor]}")
    elif [[ -z "$input" ]]; then
      break
    fi
  done

  # Restore terminal settings
  echo -en "\033[u"  # Restore cursor position
  stty "$old_stty"  # Restore terminal settings
  echo -en "\033[0m" # Reset colors

  echo "${selected[@]}"
}

Update the READ.md file

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  if [[ $# -gt 0 ]]; then
    selected_options=$(single_list "$@")
    echo "Returned selected option: ${selected_options}"
  else
    echo "Usage: $(basename "$0") Option1 Option2 Option3 ..."
    echo "Example: single_list Option1 Option2 Option3"
    exit 1
  fi
fi