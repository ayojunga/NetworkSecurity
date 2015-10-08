#!/bin/bash

# comment out nmap code for development
# sudo nmap -sP 192.168.0.0/24

# call script to simulate nmap
#./nmap_simulate.sh
rm ipcount
rm ip.txt
rm mac.txt
for i in {1..10}
do
	cat testing_log.txt >> ipcount
	#sleep 5
done

#grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ipcount;

#-E means to interpret pattern as an extended regular expression
# o means to print only the matched (non-empty) parts of a matching line, with each such part on a separate output line
#[0-9] matches character contained within brackets
#{1,3} means that the preceding item is matched at least 1 time but not more than 3 times. 
# \. means to interpret it as just a period. If it wasn't for the backslash it would match a single character.
# each section of the command searches for part of ip address, first one is 192. then 168. then 1. then 1 and so on. 


grep -Eo  '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ipcount >> ip.txt
sort ip.txt | uniq -c

grep -Eo '[0-9A-F]{1,3}\:[0-9A-F]{1,3}\:[0-9A-F]{1,3}\:[0-9A-F]{1,3}\:[0-9A-F]{1,3}\:[0-9A-F]{1,3}' ipcount >> mac.txt 
#now this grep statement looks for the each part of the mac address.[0-9A-F] looks for numbers and letters and is separated by /: There is 6 of [0-9A-F]{1,3}\: because it looks for each section of the mac address. 

sort mac.txt | uniq -c










