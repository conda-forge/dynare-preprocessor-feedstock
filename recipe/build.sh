#!/usr/bin/env bash

set -e
set -x

export BOOST_ROOT=$PREFIX

if [ "$(uname)" == "Darwin" ]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY -fexperimental-library"
fi

meson setup --buildtype=release build_preproc -Dcpp_link_args='-pthread' || (cat $SRC_DIR/build_preproc/meson-logs/meson-log.txt; exit 1)

meson compile -C build_preproc
mkdir -p $PREFIX/bin
cp build_preproc/src/dynare-preprocessor $PREFIX/bin/dynare-preprocessor
