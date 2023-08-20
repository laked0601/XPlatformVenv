#!/bin/bash

project_name=
user_name=

# Remove the existing directory
rm -rf "$project_name"

# Clone the repository
git clone "https://github.com/$user_name/$project_name"

# Create a virtual environment
python3 -m venv "./$project_name/env"

# Install the required packages
"./$project_name/env/bin/python" -m pip install -r "./$project_name/requirements.txt"

# Add project directory to path on running of each file

customize_path="./$project_name/env/lib/python3.8/site-packages/sitecustomize.py"

echo "from sys import path" > "$customize_path"
echo "from os import pardir" >> "$customize_path"
echo "from os.path import abspath, dirname, join" >> "$customize_path"
echo "script_directory = abspath(dirname(__file__))" >> "$customize_path"
echo "target_directory = abspath(join(script_directory, pardir, pardir, pardir))" >> "$customize_path"
echo "if target_directory not in path:" >> "$customize_path"
echo "    path.extend([target_directory])" >> "$customize_path"
