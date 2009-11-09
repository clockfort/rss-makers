#!/bin/bash
cd /users/u15/devnull/public_html/feeds/
dayoftheweek=$(date +"%a")
today_date='<pubDate>'$(date +"%a, %d %b %Y %H:%M:%S %z")'</pubDate>'
human_date=$(date +"%A %D")
main_file="pigs.rss"
item_file="temp/pigs_yest"

rm $main_file
echo "<rss version='2.0'>"                                  >> $main_file
echo "<channel>"                                            >> $main_file
echo "<title>CSH's Biggest Pigs</title>"                    >> $main_file
echo "<link>http://clockfort.com/feeds/</link>"             >> $main_file
cat $item_file >> $main_file
echo "<item>"                                               >  $item_file
echo $today_date                                            >> $item_file
echo "<title>CSH's Biggest Pigs for '$human_date'</title>"  >> $item_file
echo "<description>"                                        >> $item_file
head -15 /users/.oinkers | awk '{ $2=$2/1024" MB" ;print $0 }' >> $item_file
echo "</description>"                                  >> $item_file
echo "</item>"                                         >> $item_file
cat $item_file >> $main_file
echo "</channel>"                                      >> $main_file
echo "</rss>"                                          >> $main_file

