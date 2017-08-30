#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR/config -R /etc/pemalert
ln -s $DIR/pemalert.sh /usr/local/bin/pemalert
