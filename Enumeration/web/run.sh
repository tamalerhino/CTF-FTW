#!/bin/bash
url=$1

# Check to see if assetfinder and/or amass is installed
if ! command -v assetfinder &> /dev/null
then
    echo "assetfinder could not be found it might not be installed or in the path!"
    exit
fi

if [ ! command -v amass &> /dev/null];then
	echo "amass cound not be found it might not be installed or be in the path"
	exit
fi

if [ ! -d "$url" ];then
	mkdir $url
fi
if [ ! -d "$url/recon" ];then
	mkdir $url/recon
fi


echo "[+] Harvesting subdomains with assetfinder.."
assetfinder $url >> $url/recon/assets.txt
cat $url/recon/assets.txt | grep $1 >> $url/recon/final.txt
rm $url/recon/assets.txt

echo "[+] Harvesting subdomains with amass.."
amass enum -d $url >> $url/recon/f.txt
sort -u $url/recon/f.txt >> $url/recon/final.txt
rm $url/recon/f.txt

