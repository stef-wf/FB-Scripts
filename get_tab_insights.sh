#!/bin/bash
filecontent=( `cat "tab_insights_logfile" `)    
for line in "${filecontent[@]}"
do
	
STR_ARRAY=(`echo $line | tr "," "\n"`)
fbid=${STR_ARRAY[0]}
token=${STR_ARRAY[1]}

#here are default FBID and token values for the wildfire page. uncomment these and comment everything above this line if you're testing 
#fbid=5423913255
#token=AAABzmjYnQckBAImO6MjvYpSE3GNjXc46ZAAuOZCZB8xtIGZAQ0X0ZBoRlJxjZC9RLrIlVLqe3nfEgURQZBw5dSJZCgL7qJOLvOYPZAVLzS0Ta7HTkL8qiGCMp

curl "https://graph.facebook.com/$fbid/insights/page_tab_views_login_top_unique/day?since=2012-02-19&until=2012-04-01&access_token=$token" | ruby -e "require 'rubygems'; 
require 'json'; 

insights = JSON.parse(gets);
		if insights['data'].nil?  #edge case for when we have non-working tokens
			puts 'no data,${fbid}'
			else 
			insights['data'].each do |item|
			 	item['values'].each do |stuff|
			 		stuff['value'].each do |tabs, tabvalues|
			 			if tabs.nil? 
			 				puts ''
			 				else 	
				 				#this first line gives you the fbid
								print item['id'].split('/').first 
								print ','
								print item['name']
								print ','
								print item['title']
								print ','
								print item['id']
								print ','
				 				print stuff['end_time']
				 				print ','
				 				print tabs
				 				print ','
				 				print tabvalues
				 				puts ''
				 		end 	
				 	end
			 	end	
			end	
		end	
	
		
">>insights6.csv

done