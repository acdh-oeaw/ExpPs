#!/bin/bash

if [ "${STACK}x" = "x" ]; then
pushd ../../lib/custom
curl -LO https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/11.3/Saxon-HE-11.3.jar
curl -LO https://repo1.maven.org/maven2/org/xmlresolver/xmlresolver/4.3.0/xmlresolver-4.3.0.jar
popd
if [ "$OSTYPE" == "msys" -o "$OSTYPE" == "win32" ]
then
  pushd ../../bin
  start basexhttp.bat
  popd
else
  pushd ../../bin
  ./basexhttp &
  popd
fi
cd deployment
fi

if [ "$local_username"x = x -o "$local_password"x = x ]; then echo Missing credentials for local BaseX; exit 1; fi
#------ Settings ---------------------
export USERNAME=$local_username
export PASSWORD=$local_password
#-------------------------------------

# Eventuell Git-Version in die Daten und/oder die Website schreiben

sed -i "s~webapp/ExpPs/~${BUILD_DIR:-webapp/ExpPs}/~g" deploy-expps-content.bxs
./execute-basex-batch.sh ${BUILD_DIR:-webapp/ExpPs}/deployment/deploy-expps-content