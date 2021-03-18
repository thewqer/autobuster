#!/bin/bash
line='-----------------'
echo $line
echo 'Autobuster - Gobuster automation tool'
echo $line
echo 'use -h for help'
echo $line
echo 'Specify the target name:'
read target
echo $line
mkdir $target$currentDate

if [ $1 = '-h' ]
then
echo -e "HELP\n $line \nsyntax of tool:\n bash autobuster.sh Domainlist Wordlist Threads"
echo $line
fi

linenum=`wc -l $1 | awk '{print $1;}'`
for i in $linenum
do
   echo "Running gobuster on $i subdomains"
done

for ((i = 0 ; i <= $linenum ; i++));
do
    domain=`head -n $i $1 `
    gobuster dir -u https://$domain -w $2 -t $3 -o $target/domain$i.txt  -s "200,301,307,401,403"
done
