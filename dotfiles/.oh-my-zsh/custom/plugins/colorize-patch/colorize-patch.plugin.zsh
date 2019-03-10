# easier alias to use the plugin
alias ccat='colorize_via_pygmentize'

colorize_via_pygmentize() {
    if ! (( $+commands[pygmentize] )); then
        echo "package 'Pygments' is not installed!"
        return 1
    fi

    # If the environment varianle ZSH_COLORIZE_STYLE
    # is set, use that theme instead. Otherwise,
    # use the default.
    if [ -z $ZSH_COLORIZE_STYLE ]; then
        ZSH_COLORIZE_STYLE="default"
    fi

    # pygmentize stdin if no arguments passed
    if [ $# -eq 0 ]; then
        pygmentize -O style="$ZSH_COLORIZE_STYLE" -g
        return $?
    fi

    # guess lexer from file extension, or
    # guess it from file contents if unsuccessfuli

    local FNAME lexer
    for FNAME in $@
    do
        lexer=$(pygmentize -N "$FNAME")
        if [[ $lexer != text ]]; then
            pygmentize -O style="$ZSH_COLORIZE_STYLE" -l "$lexer" "$FNAME"
        else
            pygmentize -O style="$ZSH_COLORIZE_STYLE" -g "$FNAME"
        fi
    done
}
