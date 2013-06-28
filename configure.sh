#!/bin/sh

# ****************************************************************************
# This script is used to setup certain artifacts in a zip distribution after 
# the extraction process. This script has to be rerun whenever the target 
# location is moved to another folder or machine
#
# JAVA_HOME and MW_HOME need to be configured prior to invoking this script
# ****************************************************************************

SCRIPT_DIR="$(cd $(dirname $0) && pwd)"

# Users must set $MW_HOME variable
if [[ -z "$MW_HOME" || ! -d $MW_HOME ||  ! "$(ls -A $MW_HOME)" ]]; then
  echo "ERROR: You must set MW_HOME and it must point to a directory".
  echo "       where an installation of WebLogic exists. Ensure you point"
  echo "       this variable to the extract location of the zip distribution."
  exit 1;
fi

# Users must set $JAVA_HOME variable
if [[ -z $JAVA_HOME || ! -d "${JAVA_HOME}/bin" ]]; then
  echo "ERROR: You must set JAVA_HOME and point it to a valid location"
  echo "       of where your JDK has been installed"
  exit 1;
fi

# Setup the WLS environment
. ${MW_HOME}/wlserver/server/bin/setWLSEnv.sh

# Generate .product.properties and the registry.xml required for configuration
# provisioning
${JAVA_HOME}/bin/java -Dant.home=${MW_HOME}/modules/org.apache.ant_1.7.1 \
  org.apache.tools.ant.Main -f ${MW_HOME}/configure.xml

