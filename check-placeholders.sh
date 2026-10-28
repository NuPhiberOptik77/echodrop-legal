#!/bin/sh
# Lists every [OWNER: ...] placeholder left in the published pages and exits
# non-zero while any remain. Run it before publishing: the pages must not go
# live with a placeholder showing.
cd "$(dirname "$0")" || exit 2
matches=$(grep -n '\[OWNER:' ./*.html 2>/dev/null)
if [ -n "$matches" ]; then
  printf '%s\n' "$matches"
  count=$(printf '%s\n' "$matches" | wc -l | tr -d ' ')
  echo "check-placeholders: $count line(s) still carry an [OWNER: ...] placeholder." >&2
  exit 1
fi
echo "check-placeholders: no [OWNER: ...] placeholders left."
exit 0
