@echo off

set project_name=
set user_name=

rem Remove the existing directory
rmdir /s /q %project_name%

rem Clone the repository
git clone https://github.com/%user_name%/%project_name%

rem Create a virtual environment
python -m venv ".\%project_name%\env"

rem Install the required packages
".\%project_name%\env\Scripts\python.exe" -m pip install -r ".\%project_name%\requirements.txt"

rem Add project directory to path on running of each file

set customize_path=.\%project_name%\env\Lib\site-packages\sitecustomize.py

echo from sys import path > %customize_path%
echo from os import pardir >> %customize_path%
echo from os.path import abspath, dirname, join >> %customize_path%
echo script_directory = abspath(dirname(__file__)) >> %customize_path%
echo target_directory = abspath(join(script_directory, pardir, pardir, pardir)) >> %customize_path%
echo if target_directory not in path: >> %customize_path%
echo     path.extend([target_directory]) >> %customize_path%
