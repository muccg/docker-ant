#!/bin/sh
#
# Script to build images
#

# break on error
set -e

REPO="muccg"
DATE=`date +%Y.%m.%d`

# build dirs, top level is python version
for javadir in */
do
    javaver=`basename ${javadir}`

    for antdir in ${javadir}*/
    do
        antver=`basename ${antdir}`

        image="${REPO}/ant:${javaver}-${antver}"
        echo "################################################################### ${image}"
        
        ## warm up cache for CI
        docker pull ${image} || true

        ## build
        docker build --pull=true -t ${image}-${DATE} ${antdir}
        docker build -t ${image} ${antdir}

        ## for logging in CI
        docker inspect ${image}-${DATE}

        # push
        docker push ${image}-${DATE}
        docker push ${image}

    done
done
