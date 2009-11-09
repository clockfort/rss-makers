#!/bin/bash
#Wrap pubDate information over the extremely bare-bones RSS feed provided
#by mygirls.name for dumont, so that this can be tweeted automatically via
#tweetfeed.
#--Chris Lockfort (devnull)
cd /users/u15/devnull/public_html/feeds/
rm rss
/opt/csw/bin/wget -q http://michael_dumont.mygirls.name/rss

#Example format:
#<pubDate>Tue, 21 Apr 2009 00:00:00 -0500</pubDate>
today_date='<pubDate>'$(date +"%a, %d %b %Y %H:%M:%S %z")'<\/pubDate>'
yest_date="`cat temp/yestdate.txt`"
sed -e "s/<title>Today/$today_date <title>Today/g" rss > temp/dumont_rss_temp
sed -e "s/<title>Tom/$yest_date <title>Tom/g" temp/dumont_rss_temp > dumont_girl.rss
echo $today_date > temp/yestdate.txt
