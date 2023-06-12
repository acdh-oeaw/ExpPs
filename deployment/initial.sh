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
curl --connect-timeout 5 --max-time 10 --retry 3 --retry-delay 0 --retry-max-time 40 --retry-connrefused 0 -s -D - "http://localhost:8984" -o /dev/null | head -n1 | grep -q '\([23]0[0-9]\)'
fi

cd deployment

if [ "$local_username"x = x -o "$local_password"x = x ]; then echo "Missing credentials for local BaseX, using admin:${BASEX_admin_pw:-admin}"; local_username=admin; local_password="${BASEX_admin_pw:-admin}"; fi
#------ Settings ---------------------
export USERNAME=$local_username
export PASSWORD=$local_password
#-------------------------------------

# Eventuell Git-Version in die Daten und/oder die Website schreiben

sed -i "s~../webapp/ExpPs/~${BUILD_DIR:-../webapp/ExpPs}/~g" deploy-expps-content.bxs
./execute-basex-batch.sh ${BUILD_DIR:-../webapp/ExpPs}/deployment/deploy-expps-content $1