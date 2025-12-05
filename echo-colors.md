# Shell Script Color Codes 🎨

This document contains easy-to-use ANSI color codes for enhancing shell script output.

---

## Basic Color Codes

| Color   | ANSI Code |
|-------- |----------|
| Reset   | `\e[0m`  |
| Black   | `\e[30m` |
| Red     | `\e[31m` |
| Green   | `\e[32m` |
| Yellow  | `\e[33m` |
| Blue    | `\e[34m` |
| Magenta | `\e[35m` |
| Cyan    | `\e[36m` |
| White   | `\e[37m` |

---

## Bold Color Codes

| Bold Color  | ANSI Code   |
|------------ |------------|
| Bold Red    | `\e[1;31m` |
| Bold Green  | `\e[1;32m` |
| Bold Yellow | `\e[1;33m` |

---

## Usage Example

```bash
#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${RED}Error: Something went wrong!${RESET}"
echo -e "${GREEN}Success: Execution completed!${RESET}"
echo -e "${YELLOW}Warning: Low Disk Space!${RESET}"
```

---

### Notes

✔ Always reset the color using `${RESET}` after the message  
✔ Works in most Linux/macOS terminals  
❌ Windows CMD does **not** support ANSI by default  

---
