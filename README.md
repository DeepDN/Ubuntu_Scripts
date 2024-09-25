# Ubuntu_Scripts


Here's an updated `README.md` that includes the previous instructions along with the new functionality for selecting and running scripts from multiple subdirectories:

```markdown
# Ubuntu Software Installation Scripts

This repository contains various shell scripts for installing popular software on Ubuntu. Each script is designed to streamline the installation process and ensure you have the necessary tools up and running on your system with minimal effort.

## Getting Started

To use these scripts, follow the steps below:

### 1. Clone the Repository

First, clone the repository to your local machine using the following command:

```bash
git clone https://github.com/DeepDN/Ubuntu_Scripts.git
```

### 2. Navigate to the Specific Software Folder

Once the repository is cloned, navigate to the folder corresponding to the software you want to install. Use the `cd` command to move into the desired directory:

```bash
cd Ubuntu_Scripts/<Software_Folder_Name>
```

### 3. List the Script Files

Use the `ls` command to list the contents of the directory. You should see a `.sh` file (shell script) in white color.

```bash
ls
```

### 4. Make the Script Executable

Before you can run the script, you need to make it executable. Use the `chmod` command to change the file's permissions:

```bash
chmod +x <Script_File_Name>.sh
```

### 5. Verify the Permission Change

After changing the permissions, verify that the script is now executable by listing the files with detailed information:

```bash
ls -la
```

The script file should now appear in green, indicating that it is executable.

### 6. Run the Script

Finally, run the script to install the software:

```bash
./<Script_File_Name>.sh
```

The script will execute, and the software will be installed on your Ubuntu system.

---

## Running Scripts from Multiple Subdirectories

If you have a directory structure where each subdirectory contains multiple `.sh` files, you can use the provided script to run all `.sh` files in one or more selected subdirectories at once.

### 1. Prepare the Directory Structure

Ensure your main directory is organized with subdirectories containing `.sh` files that you want to execute. For example:

```
/path/to/main_directory
├── subdirectory1
│   ├── script1.sh
│   └── script2.sh
├── subdirectory2
│   ├── script3.sh
│   └── script4.sh
└── subdirectory3
    ├── script5.sh
    └── script6.sh
```

### 2. Use the Automation Script

To run all `.sh` files in selected subdirectories, use the following steps:

1. **Clone the Repository** (if you haven't already):

    ```bash
    git clone https://github.com/DeepDN/Ubuntu_Scripts.git
    ```

2. **Navigate to the Main Directory**:

    ```bash
    cd /path/to/main_directory
    ```

3. **Run the Automation Script**:

    Run the following script to list available subdirectories and select which ones you want to run:

    ```bash
    ./run_scripts_in_subdirectories.sh
    ```

    The script will:
    - Display a list of subdirectories.
    - Allow you to select one or more subdirectories by entering their corresponding numbers.
    - Run all `.sh` files in the selected subdirectories.

### Example of Execution:

- After navigating to the main directory, running the script will look like this:

    ```bash
    $ ./run_scripts_in_subdirectories.sh
    Available subdirectories:
    1. subdirectory1
    2. subdirectory2
    3. subdirectory3
    Enter the numbers of the subdirectories you want to run scripts from (separated by spaces): 1 3
    ```

- The script will then execute all `.sh` files in `subdirectory1` and `subdirectory3`.

## Contribution

Feel free to contribute to this repository by adding more installation scripts or improving the existing ones. Pull requests are welcome!

