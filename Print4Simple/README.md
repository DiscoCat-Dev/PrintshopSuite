# 🛠️ Print4Simple (Pascal)

**Print4Simple** is a fast, simple Pascal program that calculates the number of sheets and empty pages required for duplex printing at 4 pages per sheet (landscape).

## ✅ Features

- Duplex printing (2 pages per side, 4 per sheet).
- Strong input validation using Pascal's `word` type.
- Clear error messages for user mistakes.
- Compact and portable.

## 📦 Requirements

- Free Pascal Compiler (FPC)

## 🚀 Usage

```bash
fpc print4simple.pas
./print4simple
```

After launching, enter the page ranges of the printing material to determine the number of empty pages to be left and the total number of sheets.

## Why Pascal for Print4Simple?

*Print4Simple* is written in Free Pascal using Free Pascal Compiler (FPC), a strong, statically typed language that provides rigorous type safety (e.g., through the use of `word` for natural numbers). 

- Free Pascal is fast and has low resource usage. 

- It has strong typing and safety, making it ideal for input validations.

- Pascal binaries start immediately, giving instant startups for programs.

> ⚙️ **Note**: This program is provided as source code only. Users are expected to compile it using [Free Pascal Compiler](https://www.freepascal.org/download.html). Cross-platform compilation (e.g., compiling for Windows on Linux) is possible but not officially supported here.
