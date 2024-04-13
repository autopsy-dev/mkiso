# ISO Converter Script

This script helps you convert a directory or a single file into an ISO file format using a command-line interface. It is particularly useful for creating ISO images from folders or files on Unix-based systems.

## Features

- Interactive prompts to guide through the ISO creation process.
- Can be executed with or without a pre-specified path as a command-line argument.
- Error handling to ensure valid paths and file names.
- Customizable ISO file naming.

## Prerequisites

To use this script, you need:
- A Unix-like operating system with a Bash shell.
- `mkisofs` tool installed for ISO file creation. This can typically be installed via your package manager (e.g., `apt-get install genisoimage` on Debian-based systems).

## Usage

### Running the Script

You can start the script either by specifying the path directly as an argument or by entering it interactively when prompted.

#### Syntax

```bash
./mkiso.sh [path_to_directory_or_file]
