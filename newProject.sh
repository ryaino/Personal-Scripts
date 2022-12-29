#!/bin/bash
function kebab_case() {
  echo -n "$1" |\
  sed 's/\([^A-Z+]\)\([A-Z0-9]\)/\1-\2/g' |\
  sed 's/\([0-9]\)\([A-Z]\)/\1-\2/g' |\
  sed 's/\([A-Z]\)\([0-9]\)/\1-\2/g' |\
  sed 's/--/-/g' |\
  sed 's/\([\/]\)-/\1/g' |\
  tr '[:upper:]' '[:lower:]'
}

ORIGINAL_NAME=$1
KEBAB_NAME="$(kebab_case ${ORIGINAL_NAME})"
LOWERCASE_NAME="${ORIGINAL_NAME,,}"

cd ..
git clone https://github.com/ryaino/Backend-Quickstart.git
mv Backend-Quickstart $KEBAB_NAME
cd $KEBAB_NAME

git clone https://github.com/ryaino/frontend.git

sed -i -e "s/BackendQuickstart/${ORIGINAL_NAME}/g" src/main/java/field/ryan/backendquickstart/BackendQuickstartApplication.java
find ./ -type f -exec sed -i -e "s/backendquickstart/${LOWERCASE_NAME}/g" {} \;
sed -i -e "s/backend-quickstart/${KEBAB_NAME}/g" docker-compose.yml
sed -i -e "s/backend-quickstart/${KEBAB_NAME}/g" Dockerfile
sed -i -e "s/backend-quickstart/${KEBAB_NAME}/g" pom.xml
sed -i -e "s/backend-quickstart/${KEBAB_NAME}/g" buildServer.sh

mv src/main/java/field/ryan/backendquickstart src/main/java/field/ryan/$KEBAB_NAME
mv src/main/java/field/ryan/$KEBAB_NAME/BackendQuickstartApplication.java src/main/java/field/ryan/$KEBAB_NAME/${ORIGINAL_NAME}Application.java

