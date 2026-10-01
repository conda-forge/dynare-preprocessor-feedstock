#!/usr/bin/env bash

set -e
set -x

export BOOST_ROOT=$PREFIX

if [ "$(uname)" == "Darwin" ]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

meson setup ${MESON_ARGS} build_preproc \
  -Dbuild_cli=enabled \
  -Dbuild_library=disabled \
  -Dbuild_doc=false \
  -Dcpp_link_args="-pthread -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"

meson compile -C build_preproc
meson install -C build_preproc
