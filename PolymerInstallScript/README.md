# Install Script of Polymer for Windows

The Polymer project is only for Linux.  
So, the scripts I wrote for building Polymer project on Windows.

## requirement
1. [Build Tools for Visual Studio 2017 and Visual C++ build tools workload](https://visualstudio.microsoft.com/downloads/)
2. [Anaconda](https://www.anaconda.com/distribution/)
3. [Polymer Project](https://www.hygeos.com/polymer)

## How to use it
1. Open Anaconda Prompt
2. Enter the Polymer project
3. Copy the scripts to the folder
4. Type command "Set-ExecutionPolicy Bypass -Scope Process -Force;"
5. Run the script "Polymer-Installer-For-WIndows"

## Process of execution of the scripts
1. Install dependencies Polymer needs
2. Fetching auxiliary data
3. Build the project
4. Create folders the project needs
5. When the scripts finished, you can run "python polymer_cli.py -h" and know if the installing is successful or not.
