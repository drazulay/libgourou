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
    git clone https://github.com/drazulay/updfparser.git lib/updfparser
    pushd lib/updfparser
    cmake .
    ldconfig
    popd
fi
