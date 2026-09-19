@echo on

set "BOOST_ROOT=%LIBRARY_PREFIX%"
set "BOOSTROOT=%LIBRARY_PREFIX%"

meson setup build_win ^
    --prefix="%LIBRARY_PREFIX%" ^
    --libdir="%LIBRARY_LIB%" ^
    --includedir="%LIBRARY_INC%" ^
    --bindir="%LIBRARY_BIN%" ^
    --buildtype=release ^
    -Dbuild_cli=enabled ^
    -Dbuild_library=disabled ^
    -Dbuild_doc=false ^
    -Dcpp_args="-I%LIBRARY_INC%" ^
    -Dcpp_link_args="-L%LIBRARY_LIB%"
if errorlevel 1 exit 1

meson compile -C build_win -v
if errorlevel 1 exit 1

meson install -C build_win
if errorlevel 1 exit 1

