#!/bin/bash

# This script simply climbs up the current working dir until 
# it finds a project's build dir and runs ctest within it. It
# is intented to make running ctest fromw within vim a bit easier.

while [ `pwd` != "/" ]; do
	if [ -d build ]; then
		cd build && ctest "$@"
		exit $?
	fi
	cd ..
done
exit 1
