-- Get the terminal width

local function getTerminalWidth()
	local is_windows = package.config:sub(1, 1) == "\\" -- check OS
	local handle
	local width

	if is_windows then
		-- use PowerShell to get terminal width
		handle = io.popen("powershell -Command '[console]::WindowWidth'")
	else
		-- use tput for Unix-like systems
		handle = io.popen("tput cols")
	end

	if handle then
		local result = handle:read("*a")
		handle:close()
		width = tonumber(result)
	end

	return width or 80 --fallback width
end

-- Boxed ASCII Banner for "Welcome to the Printshop"
local function printBoxedBanner(str)
	local final = {}
	local banner = {}
	for c in string.gmatch(str, ".") do
		if c == " " then
			table.insert(final, " ") -- Preserve space
		else
			table.insert(final, "|" .. c)
		end
	end

	local result = table.concat(final)

	for c in string.gmatch(result, "%S+") do
		table.insert(banner, c .. "|" .. " ")
	end

	banner = table.concat(banner)
	-- trim last space
	local last_char = string.sub(banner, -1)
	if last_char == " " then
		banner = string.sub(banner, 1, -2)
	end

	local border = "+" .. string.rep("-", (#banner - 2)) .. "+"

	local term_width = getTerminalWidth()
	local padding = math.max(0, (term_width - #border) // 2)
	local pad = string.rep(" ", padding)

	print()
	print(pad .. border)
	print(pad .. banner)
	print(pad .. border)
	print()
end

-- Define helper functions

local function pageCounter(end_page, start_page, pages)
	pages = pages or 4
	local total_pages = end_page - start_page + 1 --inclusive
	local div = total_pages // pages
	local mod = total_pages % pages
	local empty
	local sheets

	if mod == 0 then
		empty = mod
		sheets = div
	else
		empty = pages - mod
		sheets = div + 1
	end

	return empty, sheets
end

local function errChecker(num)
	assert(math.type(num) == "integer", "Invalid input: the number must be an integer!")
	assert(num >= 1, "Invalid input: the number cannot be less than 1.")
end

local function pageChecker(pages)
	assert(math.type(pages) == "integer", "Invalid input: the number must be an integer!")
	assert(pages >= 1 and pages <= 4, "The number cannot be less than 1 or greater than 4.")
end

local function pageChecker_2(pages)
	assert(math.type(pages) == "integer", "Invalid input: the number must be an integer!")
	assert(pages >= 1 and pages <= 2, "The number cannot be less than 1 or greater than 2.")
end

local function orientChecker(str)
	str = string.lower(str)
	str = string.gsub(str, "%s+", "")
	assert(str == "l" or str == "p", "Invalid input: either 'l' or 'p'.")
end

-- Define the main function
local function main()
	printBoxedBanner("Welcome to the Printshop")

	-- Greeting
	local warn =
		"This program prints pages per sheet (either one or both sides) depending on the orientation of the sheet.\n"
	io.write(warn)
	print()

	-- Get orientation
	io.write("Enter the orientation of the sheet (portrait = 'p', landscape = 'l'): ")
	local orient = io.read()
	orientChecker(orient)
	print()

	-- Get page numbers
	io.write("Enter the number of the last page: ")
	local last = io.read("n")
	errChecker(last)

	io.write("Enter the number of the start page: ")
	local start = io.read("n")
	errChecker(start)

	assert(last >= start, "The last page cannot be less than the start page.")
	print()

	-- Get number of pages per sheet
	local pages
	if orient == "p" then
		io.write("In portrait mode, only one or two pages (both sides) can be printed.\n")
		io.write("Enter the number of pages to be printed on a sheet: ")
		pages = io.read("n")
		pageChecker_2(pages)
	else
		io.write("Enter the number of pages to be printed on a sheet: ")
		pages = io.read("n")
		pageChecker(pages)
	end

	-- Calculate results
	local empty_pages, total_sheets = pageCounter(last, start, pages)

	-- Output results
	print()
	io.write("Number of pages to remain empty: ", empty_pages, "\n")
	io.write("Total number of sheets for printing: ", total_sheets, "\n")
end

-- call the main function
main()
