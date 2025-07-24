#!/bin/bash

# Define the main directory (change this to your directory path)
MAIN_DIR=/home/deepak/Desktop/Practice/Software_Scripts/Ubuntu_Scripts/ #Enter your clone directory path

# List all subdirectories in the main directory
echo "Available subdirectories:"
subdirs=($(find "$MAIN_DIR" -mindepth 1 -maxdepth 1 -type d))
for i in "${!subdirs[@]}"; do
  echo "$((i+1)). ${subdirs[$i]##*/}"
done

# Prompt the user to choose subdirectories (multiple selections allowed)
read -p "Enter the numbers of the subdirectories you want to run scripts from (separated by spaces): " -a choices

# Validate user input
for choice in "${choices[@]}"; do
  if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -le 0 ] || [ "$choice" -gt "${#subdirs[@]}" ]; then
    echo "Invalid selection: $choice. Exiting."
    exit 1
  fi
done

# Process each selected subdirectory
for choice in "${choices[@]}"; do
  selected_subdir="${subdirs[$((choice-1))]}"
  echo "Processing scripts in: ${selected_subdir##*/}"

  # Find and run all .sh files in the selected subdirectory
  find "$selected_subdir" -type f -name "*.sh" | while read -r script; do
    # Make each script executable
    chmod +x "$script"
    
    # Execute the script
    echo "Running $script..."
    "$script"
    
    # Check if the script ran successfully
    if [ $? -eq 0 ]; then
      echo "$script executed successfully."
    else
      echo "Error executing $script."
    fi
  done
done

