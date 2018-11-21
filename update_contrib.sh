#!/bin/bash
SCRIPT_DIR=`dirname $0`
CONTRIB_DIR=$SCRIPT_DIR/contrib

rm -rf $CONTRIB_DIR/samba
mkdir $CONTRIB_DIR/samba
wget -qO - https://github.com/dperson/samba/archive/master.tar.gz | tar -xz --strip 1 -C $CONTRIB_DIR/samba

