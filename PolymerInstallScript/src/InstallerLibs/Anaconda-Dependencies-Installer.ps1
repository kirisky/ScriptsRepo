# Set-ExecutionPolicy Bypass -Scope Process -Force; scriptname.ps1

function Conda-Install($packageName)
{
    conda install -c conda-forge $packageName
}


# mandatory dependencies
# python cython numpy pyhdf scipy netcdf4 pandas
function Install-Mandatory-CondaDependencies
{
    Conda-Install("python")
    Conda-Install("cython")
    Conda-Install("numpy")
    Conda-Install("pyhdf")
    Conda-Install("scipy")
    Conda-Install("netcdf4")
    Conda-Install("pandas")
}

# MERIS support (optional) -- has huge size
# avalentino::pyepr"
function Install-Meris-CondaDependencies
{
    Conda-Install("avalentino::pyepr")
}

# S2-MSI support (optional) -- has huge size
# glymur pyproj lxml"
function Install-S2MSI-CondaDependencies
{
    Conda-Install("glymur")
    Conda-Install("pyproj")
    Conda-Install("lxml")
}

# GSW support (global surface water landmask - optional)
# gdal
function Install-GSW-CondaDependencies
{
    Conda-Install("gdal")
}

# ERA-Interim support (optional)
# pygrib bioconda::ecmwfapi
# pygrib package is not supported on Windows
function Install-ERA-Interim-CondaDependencies
{
    Conda-Install("bioconda::ecmwfapi")
}

# python2 support (optional)
# urllib3"
function Install-Python2Support-CondaDependencies
{
    Conda-Install("urllib3")
}



Install-Mandatory-CondaDependencies

Install-Meris-CondaDependencies

Install-S2MSI-CondaDependencies

Install-GSW-CondaDependencies

# pygrib package is not supported on Windows
# Install-ERA-Interim-CondaDependencies

Install-Python2Support-CondaDependencies