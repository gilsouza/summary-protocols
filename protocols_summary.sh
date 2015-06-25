#!/bin/bash

FILE=$1
TIMESTAMP=$(date +%s)

#replace
replace1="pcap/"
replace2=".pcap"
NAME_FILE="${FILE/$replace1}"
NAME_FILE="${NAME_FILE/$replace2}"

echo $NAME_FILE

echo "Lendo arquivo $FILE..."

mkdir -p graphs/protocolos_$NAME_FILE
tshark -r $FILE -q -z io,phs | grep -oP '^[\s\t]*([a-zA-z0-9-])+[^\w]+frames:([\d]+)' | sed -e '1d;$d;s/frames:/,/' | awk '{print $1 $2}' >> graphs/protocolos_$NAME_FILE/totalProtocols_$NAME_FILE.csv

echo "Arquivos .cvs gerados!"
echo "Gerando gráficos..."

cd graphs/protocolos_$NAME_FILE/

/usr/bin/gnuplot << EOF

set boxwidth 0.7
set style fill solid
set datafile separator ","
set title "Pacote por Protocolo"
set xlabel "Protocolos"
set ylabel "Numero de Pacotes"
set term png size 1920,1200
set output "totalProtocols_$NAME_FILE.png"
plot "totalProtocols_$NAME_FILE.csv" using 2: xtic(1) with boxes title "pacotes"
set term postscript eps
set output "totalProtocols_$NAME_FILE.eps"
plot "totalProtocols_$NAME_FILE.csv" using 2: xtic(1) with boxes title "pacotes"
exit
EOF

echo "Gráfico do arquivo $FILE gerado com sucesso!"