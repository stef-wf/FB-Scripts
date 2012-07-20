#!/bin/bash
#filecontent=( `cat "tab_views_logfile" `)    
#for line in "${filecontent[@]}"
#do
#insights_logfile must contain four pieces of information separated by commas. fbid, access token, start date, and end date
#date format =>  2011-01-01 

#STR_ARRAY=(`echo $line | tr "," "\n"`)
#fbid=${STR_ARRAY[0]}
#token=${STR_ARRAY[1]}

fbid=5423913255
token=AAABzmjYnQckBAImO6MjvYpSE3GNjXc46ZAAuOZCZB8xtIGZAQ0X0ZBoRlJxjZC9RLrIlVLqe3nfEgURQZBw5dSJZCgL7qJOLvOYPZAVLzS0Ta7HTkL8qiGCMp

curl "https://graph.facebook.com/$fbid/insights/page_tab_views_login_top_unique/day?since=2012-02-19&until=2012-04-01&access_token=$token" | ruby -e "require 'rubygems'; 
require 'json'; 

insights = JSON.parse(gets);
			insights['data'].each do |value|
				print value['name']
				print ','
				print value['title']
				print ','
				print value['period']
				print ','
				print value['id']
				print ','
				for value['values'].each do |stuff|
					print stuff.keys
				end
				print ','
			end	
			puts '' 
	
		
">>insights6.txt

#done