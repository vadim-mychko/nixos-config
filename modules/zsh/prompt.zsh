'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # Prompt colors.
  local white='7'
  local red='9'
  local green='10'
  local yellow='11'
  local blue='12'
  local magenta='13'
  local cyan='14'
  local grey='15'

  # Left prompt segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    context                   # user@host
    dir                       # current directory
    vcs                       # git status
    # command_execution_time  # previous command duration
    # =========================[ Line #2 ]=========================
    newline                   # \n
    # virtualenv              # python virtual environment
    prompt_char               # prompt symbol
  )

  # Right prompt segments.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    # command_execution_time  # previous command duration
    # virtualenv              # python virtual environment
    # context                 # user@host
    # time                    # current time
    # =========================[ Line #2 ]=========================
    newline                   # \n
  )

  # Basic style options that define the overall prompt look.
  typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=           # no segment icons

  # Add an empty line before each prompt except the first. This doesn't emulate the bug
  # in Pure that makes prompt drift down whenever you use the Alt-C binding from fzf or similar.
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Magenta prompt symbol if the last command succeeded.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=$green
  # Red prompt symbol if the last command failed.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=$red
  # Default prompt symbol.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='$'
  # Prompt symbol in command vi mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='$'
  # Prompt symbol in visual vi mode is the same as in command mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='$'
  # Prompt symbol in overwrite vi mode is the same as in command mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=false

  # Grey Python Virtual Environment.
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$grey
  # Don't show Python version.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  # Blue current directory.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$blue

  # Context format when root: user@host. The first part white, the rest grey.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE="%F{$white}%n%f%F{$grey}@%m%f"
  # Context format when not root: user@host. The whole thing grey.
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE="%F{$grey}%n@%m%f"
  # Don't show context unless root or in SSH.
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION=

  # Green Git prompt. This makes stale prompts indistinguishable from up-to-date ones.
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=$green

  # Disable async loading indicator to make directories that aren't Git repositories
  # indistinguishable from large Git repositories without known state.
  typeset -g POWERLEVEL9K_VCS_LOADING_TEXT=

  # Don't wait for Git status even for a millisecond, so that prompt always updates
  # asynchronously when Git state changes.
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0

  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked)
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON=
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED}_ICON=
  typeset -g POWERLEVEL9K_VCS_DIRTY_ICON='*'
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='$P9K_CONTENT'

  # Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
  # when accepting a command line. Supported values:
  #
  #   - off:      Don't change prompt when accepting a command line.
  #   - always:   Trim down prompt when accepting a command line.
  #   - same-dir: Trim down prompt when accepting a command line unless this is the first command
  #               typed after changing current working directory.
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  # Instant prompt mode.
  #
  #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
  #              it incompatible with your zsh configuration files.
  #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
  #              during zsh initialization. Choose this if you've read and understood
  #              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
  #   - verbose: Enable instant prompt and print a warning when detecting console output during
  #              zsh initialization. Choose this if you've never tried instant prompt, haven't
  #              seen the warning, or if you are unsure what this all means.
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

  # Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
  # For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
  # can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
  # really need it.
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # If p10k is already loaded, reload configuration.
  # This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
  (( ! $+functions[p10k] )) || p10k reload
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
