#!/usr/bin/env bash
#---------------------------------------------------------------------------
# Copyright 2011-2012 The Open Source Electronic Health Record Agent
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#---------------------------------------------------------------------------

# Installs Intersystems Caché 2011 in an automated way
# This utility requires root privliges

# Make sure we are root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# TODO: ensure we are on RHEL/CentOS

# TODO: clear GZIP environment variable

# Path to Parameters File for silent/unattended install
parametersFile=/root/VistA-installation-scripts/Cache/parameters.isc

# unzip the cachekit in a temp directory
cachekit=/root/cache-2011.1.2.701-lnxrh5x64.tar.gz
tempdir=/tmp/cachekit2011.1.2.701
mkdir $tempdir
chmod og+rx $tempdir
cd $tempdir
tar xzf $cachekit

# Install Caché using the installFromParametersFile command
# This is how silent/automated installs work for *nix platforms
package/installFromParametersFile $parametersFile
cd ..
rm -rf $tempdir