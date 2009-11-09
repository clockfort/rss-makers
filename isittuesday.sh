#!/bin/bash
cd /users/u15/devnull/public_html/feeds/
dayoftheweek=$(date +"%a")
today_date='<pubDate>'$(date +"%a, %d %b %Y %H:%M:%S %z")'</pubDate>'
main_file="isittuesday.rss"
item_file="temp/tues_yest"

rm $main_file
echo "<rss version='2.0'>"                             >> $main_file
echo "<channel>"                                       >> $main_file
echo "<title>Is it Tuesday?</title>"                   >> $main_file
echo "<link>http://clockfort.com/isittuesday</link>"   >> $main_file
cat $item_file >> $main_file
echo "<item>"                                          >  $item_file
echo $today_date                                       >> $item_file
echo "<title>Is today Tuesday?</title>"                >> $item_file
echo "<description>"                                   >> $item_file
if [ $dayoftheweek = "Tue" ]; then
	echo "Yes"                                     >> $item_file
else
	echo "No"                                      >> $item_file
fi
echo "</description>"                                  >> $item_file
echo "</item>"                                         >> $item_file
cat $item_file >> $main_file
echo "</channel>"                                      >> $main_file
echo "</rss>"                                          >> $main_file

