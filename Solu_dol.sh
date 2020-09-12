#! /bin/bash
echo """"""" Welcome to the solution downloder"""""""
echo -e "\n"
read -p "Please enter the url: " url
echo -e "\n"
read -p "Please provide the cookie: " cookie
x=$(echo $url |cut -f"3" -d "=")
echo $x
wget $url -O $x.html
pdf_id=$(cat $x.html | grep "startlab" | grep "<a" | grep -v Run | cut -f2 -d"?" | cut -f1 -d">" | cut -f2 -d"=" | sed 's/\"/ /g')
echo $pdf_id >> $x.txt
echo $cookie
read -p "Are you good to go with downlaod ..."
for i in $(cat $x.txt);do wget --header="Cookie: $cookie" "https://attackdefense.com/getsolution?file=walkthrough-$i.pdf&labid=$i" -O $i.pdf ;done
mkdir $x;cd $x;mv ../*.pdf ./
rm $x.html;rm $x.txt
echo -e "\n Thankx"
