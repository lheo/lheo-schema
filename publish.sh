#!/bin/bash

PROD=gasilber@www.lheo.org:/var/www/lheo/www
TEST=gasilber@www.lheo.org:/var/www/lheo/test/public_html
LOCAL=$HOME/Sites/lheo.org
DELETE=--update
RSYNC=rsync

SRC=target

chmod a+r *

if [ $# -lt 1 ]
then
    echo "Usage: $0 [test|local|production|production-ok]"
    echo "   local - publish to ${LOCAL}"
    echo "   test - fake publish to ${TEST}"
    echo "   test-ok - publish to ${TEST}"
    echo "   production - fake publish to ${PROD}"
    echo "   production-ok - publish to ${PROD}"
    exit 1
fi

if [ "$1" = "local" ]
then
    ${RSYNC} --delete  --verbose --archive \
	 --exclude 'CVS' --exclude '.svn' --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0.*' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	$SRC/2.2.0 ${LOCAL}
fi
if [ "$1" = "production-ok" ]
then
    ${RSYNC} --delete --update --archive --verbose \
	 --exclude 'CVS' --exclude '.svn' --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0*' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	$SRC/. ${PROD}/.
fi
if [ "$1" = "production" ]
then
    ${RSYNC} --dry-run --delete --archive --update --verbose \
	 --exclude 'CVS' --exclude '.svn' --exclude '*~' \
	 --exclude 'archives' --exclude 'niveaux.txt' \
	 --exclude '2.0*' \
	 --exclude '2.1.*' \
	 --exclude '1.*' \
	$SRC/. ${PROD}/.
fi
if [ "$1" = "test" ]
then
    ${RSYNC} --dry-run --archive --verbose \
	$SRC/2.2 ${TEST}/.
fi
if [ "$1" = "test-ok" ]
then
    ${RSYNC} --archive --verbose \
	$SRC/2.2 ${TEST}/.
fi
