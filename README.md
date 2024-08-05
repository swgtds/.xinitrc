
# .xinitrc Configuration File

This repository contains the `.xinitrc` configuration file, which is used to configure the X Window System startup in Unix-like operating systems.

## Introduction

The `.xinitrc` file is a shell script read by `xinit` and `startx` to initialize the X session. It typically contains commands to start window managers, set environment variables, and launch applications.

## Usage

To use the `.xinitrc` file from this repository, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/swgtds/.xinitrc.git
    ```

2. **Navigate to the cloned directory**:
    ```sh
    cd .xinitrc
    ```

3. **Backup your existing .xinitrc file** (if it exists):
    ```sh
    mv ~/.xinitrc ~/.xinitrc.backup
    ```

4. **Copy the .xinitrc file from the repository to your home directory**:
    ```sh
    cp ~/.xinitrc
    ```

5. **Make sure the .xinitrc file is executable**:
    ```sh
    chmod +x ~/.xinitrc
    ```

6. **Start your X session**:
    ```sh
    startx
    ```

Ensure any window manager or desktop environment is started with `exec` as the last command in the file. This replaces the shell with the window manager or desktop environment.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---
