# Add `colorls` man pages directory into manpath
COLORLS_MAN_BASE="$(gem contents colorls 2>/dev/null | grep '/colorls\.1$' | head -n1 | xargs dirname)"
if [ -d "$COLORLS_MAN_BASE" ]; then
  export MANPATH="$MANPATH:$COLORLS_MAN_BASE"
  if [ ! -e "$COLORLS_MAN_BASE/man1/colorls.1" ]; then
    mkdir -p "$COLORLS_MAN_BASE/man1"
    ln -s "$COLORLS_MAN_BASE/colorls.1" "$COLORLS_MAN_BASE/man1/colorls.1"
  fi
fi

# Enable tab completion for `colorls` flags
source $(dirname $(gem which colorls))/tab_complete.sh

