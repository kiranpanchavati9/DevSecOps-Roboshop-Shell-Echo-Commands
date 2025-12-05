
---

````md
# Shell Script Color Codes 🎨

This document contains easy-to-use ANSI color codes for enhancing shell script output.

---

## Basic Color Codes

| Color   | Code      |
|--------|-----------|
| Reset  | `\e[0m`   |
| Black  | `\e[30m`  |
| Red    | `\e[31m`  |
| Green  | `\e[32m`  |
| Yellow | `\e[33m`  |
| Blue   | `\e[34m`  |
| Magenta | `\e[35m` |
| Cyan   | `\e[36m`  |
| White  | `\e[37m`  |

---

## Bold Color Codes

| Bold Color | Code       |
|-----------|------------|
| Bold Red | `\e[1;31m`  |
| Bold Green | `\e[1;32m`|
| Bold Yellow | `\e[1;33m` |

---

## Example Shell Script

```bash
#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${RED}Error: Something went wrong!${RESET}"
echo -e "${GREEN}Success: Execution completed!!${RESET}"
echo -e "${YELLOW}Warning: Low Disk Space!${RESET}"
````

---

## Notes

✔ Always end colored text with `${RESET}` to return back to normal terminal color.
✔ Works in most Linux/Unix terminals.
✔ If colors do not appear, remove `-e` from `echo` and try `printf`.

---

