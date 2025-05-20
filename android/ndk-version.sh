#!/bin/bash

# Check if ANDROID_NDK environment variable is set
if [ -z "$ANDROID_NDK" ]; then
	echo "Error: ANDROID_NDK environment variable not set."
	exit 1
fi

# Try to get NDK version from source.properties
NDK_VERSION=$(grep -oP '(?<=Pkg.Revision = )[\d.]+' $ANDROID_NDK/source.properties 2>/dev/null)

# If source.properties is not available or version not found, try RELEASE.TXT
if [ -z "$NDK_VERSION" ]; then
	if [ -f "$ANDROID_NDK/RELEASE.TXT" ]; then
		# Read the first line as version string from RELEASE.TXT
		NDK_VERSION=$(head -n 1 $ANDROID_NDK/RELEASE.TXT)
		# Extract major version number (e.g. from 'r10e-rc4' -> '10')
		MAJOR_VERSION=$(echo $NDK_VERSION | grep -oP '^\D*(\d+)' | grep -oP '\d+')
	else
		echo "Error: Could not find 'source.properties' or 'RELEASE.TXT'."
		exit 1
	fi
else
	# Extract major version for newer format like '22.1.7171670' -> '22'
	MAJOR_VERSION=$(echo $NDK_VERSION | cut -d'.' -f1)
fi

# Export the major version as an environment variable
export NDK_MAJOR_VERSION=$MAJOR_VERSION
echo "NDK_MAJOR_VERSION:$NDK_MAJOR_VERSION"

