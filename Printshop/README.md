# 🛠️ Printshop (Lua)

**Printshop** is a terminal-based Lua tool for calculating print layouts. It supports multiple print modes and helps you determine how many sheets are needed and how many pages will remain blank.

## ✅ Features

- Supports duplex and simplex modes.
- Landscape and portrait orientation.
- Configurable number of pages per sheet.
- Error handling for invalid input.
- Optimized for speed and clarity.

## 📦 Requirements

- Lua 5.3+
- Can be run from any terminal with standard Lua support.

## 🚀 Usage

You can run the program by typing:

```bash
lua printshop.lua
```

Follow the instructions for choosing the sheet orientation, page ranges of the printing material, and pages per sheet.

## Miscellaneous

*Printshop* uses `tput` (on Linux) and `PowerShell` (on Windows) to calculate the terminal width in order to center the welcome banner when the program launches. If these tools are unavailable on the user's operating system, the banner may not be perfectly centered, as the program will fall back to a default width. Both the banner text and the default width can be customized by editing the source code.
