@echo on
if not exist "%LIBRARY_BIN%\dynare-preprocessor.exe" if not exist "%PREFIX%\bin\dynare-preprocessor.exe" exit 1
dynare-preprocessor example1.mod
if errorlevel 1 exit 1

