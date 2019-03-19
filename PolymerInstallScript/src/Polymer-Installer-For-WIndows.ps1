# Set-ExecutionPolicy Bypass -Scope Process -Force; 

./InstallerLibs/Anaconda-Dependencies-Installer.ps1

./InstallerLibs/Aux-Data-Downloder.ps1

python setup.py build_ext --inplace

mkdir -p ANCILLARY/METEO/

echo "Everthing is done!"