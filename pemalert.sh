#!/bin/bash
source /etc/pemalert/pemalert

REPORT=""

for PEM in $(cat /etc/pemalert/files.txt)
do
	if [[ -f $PEM ]] 
	then
		EXPIRE=$(date +%s --date="$(openssl x509 -enddate -noout -in "$PEM" | cut -d= -f 2)")
		CURRENT=$(date +%s)
		CHECK=$(expr $CURRENT + $DAYS \* 86400)
		
		if [[ $EXPIRE -lt $CHECK ]]
		then
			ISO=$(date --date="$(openssl x509 -enddate -noout -in "$PEM" | cut -d= -f 2)" --iso-8601)
			REPORT="$REPORT$PEM : $ISO\n"
		fi
	else
		REPORT="$REPORT$PEM : no existe\n";
	fi
done

if [[ ! -z $REPORT ]]
then
	REPORT="$REPORT\nAtentamente PEMalert.BOT"
	echo -e "$REPORT" | mail -s "$SUBJECT" $DST
fi
