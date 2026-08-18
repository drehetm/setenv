# After `brew install libpq` got next messages.
# libpq is keg-only, which means it was not symlinked into /opt/homebrew,
# because it conflicts with PostgreSQL.

# If you need to have libpq first in your PATH, run:
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# For compilers to find libpq you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# For pkgconf to find libpq you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

