CRONTAB

0 0 * * * * /usr/local/pemalert 

INSTALL

ln -sf pemalert.sh /usr/local/bin/pemalert
cp config -R /etc/pemalert

CONFIG

/files.txt -> Lista de archivos pem a chequear
/pemalert -> Configuracion General

DST="soporte@test.com" -> Email que recibe la notificacion
SUBJECT="Hay certificados que expiraran pronto!" -> Asunto del email
DAYS=4 -> Dias que toma el script antes de que expire el certificado para notificarlo.
