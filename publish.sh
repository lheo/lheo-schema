#!/bin/bash

VERSION=2.3
PROD=lheo@lheo.gouv.fr:lheo-schema
DEV=lheo@dev.lheo.org:www_dev
LOCAL=$HOME/websites/lheo.org
DELETE=--update
RSYNC=rsync

SRC=target/${VERSION}
DOCHTML=doc/build/html
DOCPDF=doc/build/latex/lho.pdf

chmod a+r *

if [ $# -lt 1 ]
then
    echo "Usage: $0 [test|local|production|production-ok]"
    echo "   local - publish to ${LOCAL}"
    echo "   dev - publish to ${DEV}"
    echo "   prod - fake publish to ${PROD}"
    echo "   prod-ok - publish to ${PROD}"
    exit 1
fi

if [ "$1" = "local" ]
then
    [ -d ${LOCAL} ] || mkdir -p ${LOCAL}
    ${RSYNC} --verbose --archive --exclude '*~' ${SRC} ${LOCAL}
    ${RSYNC} --verbose --archive ${DOCHTML}/. ${LOCAL}/${VERSION}/.
	${RSYNC} --verbose --archive ${DOCPDF} ${LOCAL}/${VERSION}/lheo.pdf
fi
if [ "$1" = "dev" ]
then
    ${RSYNC} --archive --verbose --exclude '*~' ${SRC} ${DEV}
    ${RSYNC} --verbose --archive ${DOCHTML}/. ${DEV}/${VERSION}/.
	${RSYNC} --verbose --archive ${DOCPDF} ${DEV}/${VERSION}/lheo.pdf
fi
if [ "$1" = "prod" ]
then
    ${RSYNC} --dry-run --archive --verbose --exclude '*~' ${SRC} ${PROD}
    ${RSYNC} --dry-run --verbose --archive ${DOCHTML}/. ${PROD}/${VERSION}/.
	${RSYNC} --dry-run --verbose --archive ${DOCPDF} ${PROD}/${VERSION}/lheo.pdf
fi
if [ "$1" = "prod-ok" ]
then
    ${RSYNC} --archive --verbose --exclude '*~' ${SRC} ${PROD}
    ${RSYNC} --verbose --archive ${DOCHTML}/. ${PROD}/${VERSION}/.
	${RSYNC} --verbose --archive ${DOCPDF} ${PROD}/${VERSION}/lheo.pdf
fi
