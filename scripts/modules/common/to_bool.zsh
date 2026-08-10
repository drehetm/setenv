# Convert string variable to value that will be interpreted as a boolean in conditional expression
str_to_bool() {
  if [[ "$1" == "true" ]]; then
    return 0
  fi

  return 1
}

# Convert integer variable to value that will be interpreted as a boolean in conditional expression
int_to_bool() {
  # Remember that by convention '0' means 'true' (or 'success') in shell scripts
  if (( "$1" == 0 )); then
    return 0
  fi

  return 1
}

