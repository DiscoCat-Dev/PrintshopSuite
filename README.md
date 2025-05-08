# 🖨️ PrintshopSuite

**PrintshopSuite** is a small, efficient toolset for calculating print layout and page distribution across paper sheets. 

It includes two lightweight programs:

- **Printshop** – A flexible Lua-based calculator with support for print modes (portrait/landscape), duplex printing, and configuration via interaction.
- **Print4Simple** – A compact, strongly-typed Pascal version that quickly calculates sheets and blank pages for 4-pages-per-sheet duplex printing.

**Designed for:**

These tools are built for students, researchers, and heavy readers who frequently print reading materials and are frustrated by imprecise sheet estimation, wasted paper, and toner. *Printshop* and *Print4Simple* help users efficiently calculate exactly how many sheets are needed — avoiding both excess and shortfalls in duplex printing jobs.

**Understanding the "pages per sheet":**

The programs rely on a user-defined value that specifies how many **logical pages** will be printed on **each physical sheet of paper**.

- For example, **4 pages to be printed on a sheet** typically means duplex printing with **2 pages on the front** and **2 on the back**.
- If a user enters **3**, it means the program will treat a full sheet as holding only 3 pages — leaving one face or slot intentionally blank (for annotations, legibility, or other reasons).
- This distinction allows the tool to account for pages left intentionally empty versus pages left over due to uneven page ranges (e.g., printing 5 pages using 4-pages-per-sheet logic).

> **Note:** *Printshop* includes additional terminal-specific features such as dynamic banner centering using `tput` (Linux) or `PowerShell` (Windows). See [`Printshop/README.md`](./Printshop/README.md)) for details.

---

## 🔧 Tools

### 🛠️ Printshop (Lua)

- Supports duplex and simplex printing
- Handles landscape and portrait orientations
- Calculates total sheets, empty pages, and layout details
- Interactive terminal input and config-based setup
- Lightweight and terminal-focused

📂 See [`Printshop/README.md`](./Printshop/README.md) for details.

---

### 🛠️ Print4Simple (Free Pascal)

- Fixed 4-pages-per-sheet layout
- Duplex assumed (front & back)
- Strong input validation
- Quick and small — ideal for fast jobs

📂 See [`Print4Simple/README.md`](./Print4Simple/README.md) for details.

---

## 📄 License

This project is licensed under the MIT License. See `LICENSE` for details.
