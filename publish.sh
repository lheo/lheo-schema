#!/bin/bash

PROD=lheo@lheo.gouv.fr:lheo-schema
DEV=lheo@dev.lheo.org:www_dev
LOCAL=$HOME/websites/lheo.org
DELETE=--update
RSYNC=rsync

SRC=target

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
    ${RSYNC} --delete  --verbose --archive \
	 --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0.*' \
	 --exclude '2.2' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	 --exclude 'doc' \
	$SRC/2.3 ${LOCAL}
fi
if [ "$1" = "dev" ]
then
    ${RSYNC} --delete --archive --update --verbose \
	 --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0*' \
	 --exclude '2.2' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	 --exclude 'doc' \
	$SRC/2.3 ${DEV}
fi
if [ "$1" = "prod" ]
then
    ${RSYNC} --dry-run --delete --archive --update --verbose \
	 --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0*' \
	 --exclude '2.2' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	 --exclude 'doc' \
	$SRC/2.3 ${PROD}
fi
if [ "$1" = "prod-ok" ]
then
    ${RSYNC} --delete --archive --update --verbose \
	 --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0*' \
	 --exclude '2.2' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	 --exclude 'doc' \
	$SRC/2.3 ${PROD}
fi
