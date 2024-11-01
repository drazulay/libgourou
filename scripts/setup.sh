#!/bin/bash

# Pugixml
if [ ! -d lib/pugixml ] ; then
    git clone https://github.com/zeux/pugixml.git lib/pugixml
    pushd lib/pugixml
    git checkout latest
    cmake .
    popd
fi

# uPDFParser
if [ ! -d lib/updfparser ] ; then
    git clone https://github.com/SamuelMarks/updfparser.git lib/updfparser
    pushd lib/updfparser
    make BUILD_STATIC=1 BUILD_SHARED=1
    cp libupdfparser.o /usr/lib/
    ldconfig
    popd
fi
