# Setup Go env vars
# Add GOPATH and GOROOT
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
# Add $GOPATH/bin to PATH
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Resolution of 'go mod tidy' issue on private repo: https://medium.com/mabar/today-i-learned-fix-go-get-private-repository-return-error-reading-sum-golang-org-lookup-93058a058dd8
#
# @ietlh comment -> disable old fix, but save it for future reference
#export GOPRIVATE="github.com/dietdoctor"
#export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

