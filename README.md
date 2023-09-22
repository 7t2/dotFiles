```
     _       _  ______ _ _           
    | |     | | |  ___(_) |          
  __| | ___ | |_| |_   _| | ___  ___ 
 / _` |/ _ \| __|  _| | | |/ _ \/ __|
| (_| | (_) | |_| |   | | |  __/\__ \
 \__,_|\___/ \__\_|   |_|_|\___||___/
```

## Overview

DotFiles is a Bash script designed to help you manage your dotfiles efficiently. Dotfiles are configuration files that usually start with a dot (e.g. `.bashrc`) and are typically used to personalize your command-line environment and various applications.

This script allows you to synchronize your dotfiles between your home directory and a project directory, or vice versa. You can easily switch between configurations and setup new user environments!

## Features

- Choose the direction of synchronization:
  - Copy dotfiles from your project directory to your home directory.
  - Copy dotfiles from your home directory to your project directory.

- Automatic backups:
  - Before overwriting existing dotfiles, the script creates a backup in a specified backup folder.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/dotfiles-sync.git

2. Run ./dotFiles.sh

3. Profit
