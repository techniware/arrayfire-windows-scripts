REM DIRECTORIES
REM USE DOUBLE QUOTES IF PATHS INCLUDE SPACES
SET WORKSPACE=C:/workspace
SET AF_DIR=%WORKSPACE%/arrayfire
REM AF_INSTALL_PATH is where ArrayFire files are installed.
REM AF_INSTALL_PATH can be relative path from AF_DIR/build or absolute path
SET AF_INSTALL_PATH="package"
SET DEPS_DIR=%WORKSPACE%/dependencies

REM ARRAYFIRE BUILD OPTIONS
REM SELECT WHICH BACKENDS TO BUILD BY SETTING THEM TO ON
SET CPU=ON
SET CUDA=OFF
SET OPENCL=OFF
REM SET THIS TO YOUR CUDA COMPUTE CAPABILITY ONLY IF BUILDING ON A REMOTE MACHINE THAT CANNOT RUN CUDA. ELSE LEAVE EMPTY
REM VALID OPTIONS "", "20", "30", "32", "35", "37", "50", "52"
SET CUDA_COMPUTE=""

REM TOOLS CONFIGURATION
SET THREADS=8
SET MSBUILD="C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" /m:%THREADS%
SET GIT_EXE="git.exe"
SET CMAKE="C:\Program Files (x86)\CMake\bin\cmake"
SET CMAKE_GENERATOR=-G "Visual Studio 12 2013 Win64"
SET CTEST="C:\Program Files (x86)\CMake\bin\ctest.exe" --force-new-ctest-process --output-on-failure

REM PATH SETTING TO RUN EXECUTABLES
SET PATH_EXT=%AF_DIR%\build\package\lib;%DEPS_DIR%\freeimage-3.16.0_x64;
if "%CPU%"=="ON" (
    SET PATH_EXT=%PATH_EXT%;%DEPS_DIR%\fftw-3.3.4;%DEPS_DIR%\OpenBLAS\package\bin;
)
if "%CUDA%"=="ON" (
    SET PATH_EXT=%PATH_EXT%;%CUDA_PATH%\bin;%CUDA_PATH%\nvvm\bin;
)
if "%OPENCL%"=="ON" (
    SET PATH_EXT=%PATH_EXT%;%WORKSPACE%\clBLAS\build\package\bin;%WORKSPACE%\clFFT\build\package\bin;
)
