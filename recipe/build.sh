#!/usr/bin/env bash

set -e
set -x

export BOOST_ROOT=$PREFIX

if [ "$(uname)" == "Darwin" ]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

meson setup build_preproc \
  --prefix=$PREFIX \
  --bindir=$PREFIX/bin \
  --libdir=$PREFIX/lib \
  --includedir=$PREFIX/include \
  --buildtype=release \
  -Dbuild_cli=enabled \
  -Dbuild_library=disabled \
  -Dbuild_doc=false \
  -Dcpp_link_args='-pthread'

meson compile -C build_preproc
meson install -C build_preproc
