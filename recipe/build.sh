#!/bin/sh

cd $SRC_DIR

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

if [ "$(uname)" == "Darwin" ]
then
    export CXX="${CXX} -stdlib=libc++"
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,$PREFIX/lib"
fi

autoreconf -f -i

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

./configure --prefix=$PREFIX --disable-silent-rules --disable-dependency-tracking
make
make install
