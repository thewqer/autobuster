#!/bin/bash
line='-----------------'
echo $line
echo -e " 
  _         _        _               _            
  /_\  _   _| |_ ___ | |__  _   _ ___| |_ ___ _ __ 
 //_\\| | | | __/ _ \| '_ \| | | / __| __/ _ \ '__|
/  _  \ |_| | || (_) | |_) | |_| \__ \ ||  __/ |   
\_/ \_/\__,_|\__\___/|_.__/ \__,_|___/\__\___|_|     
                                       -by @wqer"
echo $line
echo 'use -h for help'
echo $line
echo 'Specify the target name:'
read target
echo $line
mkdir $target

if [ $1 = '-h' ]
then
echo -e "HELP\n $line \nsyntax of tool:\n bash autobuster.sh [DOMAIN_LIST] [WORDLIST] [THREADS]"
echo $line
fi

linenum=`wc -l $1 | awk '{print $1;}'`
for i in $linenum
do
   echo "Running gobuster on $i subdomains"
done
echo $line

for ((i = 0 ; i<=$linenum ; i++));
do
    domain=`sed -n "${i}p" $1`
    echo "Running gobuster for the $i. time"
    gobuster dir -u https://$domain  -w $2 -t $3 -o $target/domain$i.txt -k || gobuster dir -u http://$domain  -w $2 -t $3 -o $target/domain$i.txt -k || echo 'invalid domain'
done
