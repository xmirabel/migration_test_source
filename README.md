# Hello World in COBOL with CMake

This project is a simple "Hello World" program written in COBOL and compiled with GnuCOBOL via CMake.

## Project Architecture

```
hello-cobol/
├── hello.cbl       # COBOL source program
├── CMakeLists.txt  # CMake compilation configuration
└── README.md       # This file
```

## Prerequisites

- GnuCOBOL (to compile COBOL code)
- CMake (version 3.10 or higher)

## Installing Prerequisites

### On Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install gnucobol cmake
```

### On Fedora/RHEL/CentOS
```bash
sudo dnf install gnucobol cmake
```

### On macOS (with Homebrew)
```bash
brew install gnu-cobol cmake
```

## Compilation

1. Create a build directory and navigate into it:
```bash
mkdir build && cd build
```

2. Configure the project with CMake:
```bash
cmake ..
```

3. Build the project:
```bash
cmake --build .
```

## Execution

After compilation, you can run the program:

```bash
./bin/hello
```

You should see the following output:
```
Hello, World!
```

## How It Works

- The `CMakeLists.txt` file defines a custom function `add_cobol_executable` that uses the GnuCOBOL compiler (cobc) to compile COBOL programs.
- The COBOL program is a simple implementation that displays "Hello, World!" on the screen.

## Notes on COBOL Comments

In COBOL, comments can be added in several ways:

1. An asterisk (`*`) in column 7 indicates that the entire line is a comment
2. A slash (`/`) in column 7 indicates a page break in printed listings (rarely used today)
3. The `REMARKS` keyword in certain divisions (obsolete)
4. In modern versions of COBOL, such as GnuCOBOL, you can also use `*>` anywhere on the line to start a comment until the end of the line

COBOL is a language that was designed when punch cards were used, which explains the importance of columns in its syntax:
- Columns 1-6: Numbering area (rarely used today)
- Column 7: Indicator (where `*` is placed for comments)
- Columns 8-72: Main code area
- Columns 73-80: Identification area (historically for numbering punch cards)

GnuCOBOL is more flexible regarding these formatting rules, but it's good to know these historical conventions as they are still respected in many existing COBOL codebases.