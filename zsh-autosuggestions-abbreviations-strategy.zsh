#!/usr/bin/env zsh

# zsh plugin to add your zsh-abbr abbreviations to zsh-autosuggestions' suggestions
# https://github.com/olets/zsh-autosuggestions-abbreviations-strategy
# v1.1.1
# Copyright (c) 2024 Henry Bley-Vroman

typeset -r ZSH_AUTOSUGGESTIONS_ABBREVIATIONS_STRATEGY_VERSION=v1.1.1
typeset -r ZSH_AUTOSUGGESTIONS_ABBREVIATIONS_STRATEGY_RELEASE_DATE="August 1, 2024"

# Name depends on https://github.com/zsh-users/zsh-autosuggestions/blob/master/zsh-autosuggestions.zsh#L747
_zsh_autosuggest_strategy_abbreviations() {
  # DUPE https://github.com/zsh-users/zsh-autosuggestions/blob/c3d4e576c9c86eac62884bd47c01f6faed043fc5/zsh-autosuggestions.zsh#L640-L641
  # Reset options to defaults and enable LOCAL_OPTIONS
  emulate -L zsh

  # DUPE https://github.com/zsh-users/zsh-autosuggestions/blob/c3d4e576c9c86eac62884bd47c01f6faed043fc5/zsh-autosuggestions.zsh#L643-L644
  # Enable globbing flags so that we can use (#m) and (x~y) glob operator
  setopt EXTENDED_GLOB
  
  # DUPE https://github.com/zsh-users/zsh-autosuggestions/blob/c3d4e576c9c86eac62884bd47c01f6faed043fc5/zsh-autosuggestions.zsh#L605-L606
  # Exit if our search string matches the ignore pattern
  [[ -n "$ZSH_AUTOSUGGEST_COMPLETION_IGNORE" ]] && [[ "$1" == $~ZSH_AUTOSUGGEST_COMPLETION_IGNORE ]] && return

  # Escape backslashes and all of the glob operators so we can use
	# this string as a pattern.
  # DUPE https://github.com/zsh-users/zsh-autosuggestions/blob/c3d4e576c9c86eac62884bd47c01f6faed043fc5/zsh-autosuggestions.zsh#L648-L650
	# - (#m) globbing flag enables setting references for match data
	# TODO: Use (b) flag when we can drop support for zsh older than v5.0.8
	local prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}"

  # Get the items that match the prefix
  # DUPE https://github.com/zsh-users/zsh-autosuggestions/blob/c3d4e576c9c86eac62884bd47c01f6faed043fc5/zsh-autosuggestions.zsh#L654
  local pattern="$prefix*"

  # Get abbreviations in the order
  # 1. global user abbreviations, in 'A a B b c d …' order
  # 2. regular user abbreviations, in 'A a B b c d …' order
  # 3. global session abbreviations, in 'A a B b c d …' order
  # 4. global session abbreviations, in 'A a B b c d …' order
  local -a abbreviations
  abbreviations+=( ${(ikQo)ABBR_GLOBAL_USER_ABBREVIATIONS} )
  abbreviations+=( ${(ikQo)ABBR_REGULAR_USER_ABBREVIATIONS} )
  abbreviations+=( ${(ikQo)ABBR_GLOBAL_SESSION_ABBREVIATIONS} )
  abbreviations+=( ${(ikQo)ABBR_REGULAR_SESSION_ABBREVIATIONS} )

  # Give the first abbreviation matching the pattern as the suggestion
  # - (r) subscript flag makes the pattern match on values
  typeset -g suggestion="${abbreviations[(r)$pattern]}"
}
