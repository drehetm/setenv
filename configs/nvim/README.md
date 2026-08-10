# Check health of installed entities
## Lazy package manager
After `Lazy` package manager installation check if it is in `OK` state.
```zsh
:checkhealth lazy
```
If something is missed - fix it!

## Plugins' dependencies
After some plugins installations check if they have all needed dependencies.
```zsh
:checkhealth telescope
:checkhealth mason
```
It will show what is missed - install it by following error/warning messages.

