#!/bin/bash

# Pugixml
if [ ! -d lib/pugixml ] ; then
    git clone https://github.com/zeux/pugixml.git lib/pugixml
    pushd lib/pugixml
    git checkout latest
    cmake .
    make all
    popd
fi

# uPDFParser
if [ ! -d lib/updfparser ] ; then
    git clone https://github.com/drazulay/updfparser.git lib/updfparser
    pushd lib/updfparser
    cmake .
    make all
    ldconfig
    popd
fi
