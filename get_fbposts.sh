#!/bin/bash
filecontent=( `cat "posts_logfile" `)    
for fbid in "${filecontent[@]}"
do
echo $fbid 

#number of posts to pull
num_posts="10"

curl "https://graph.facebook.com/$fbid/posts/?access_token=AAACPV5STJJIBAIfHaMaX7oEj96VwZCSIzGpnN1O9zNY9cp8GzNJwDOscUaihSqmiFJiQGadw6T3Am3FTZBfI6vIjVVqapKFUZAbrENWiwZDZD&limit=$num_posts" | ruby -e "require 'rubygems'; 
require 'json'; 

data = JSON.parse(gets); 

	#iterates through each post and snags info
	data['data'].each { |post| 
		print post['from']['id'] + ','
		print post['from']['name'] + ','
		print post['created_time'] + ',' 
		print post['type'] + ',' 

		if post['likes'].nil? 
			print '0,'
		else 
			print post['likes']['count'].to_s + ','
		end
		#IMPT last item must use puts to start a new line
		print post['comments']['count'].to_s + ','

		#when there are no shares, FB doesn't even have the decency to put shares count = 0 those fuckers
		if post['shares'].nil? 
			print '0,'
		else 
			print post['shares']['count'].to_s + ','
		end
		puts ''
	}
">>postlist.csv


done 

#example: post['shares']['count'] directly accesses share count

# 	in case you get lost 
#	data['data'].each  { |x|
#		puts x.keys }

# here are the keys
#shares
#actions
#comments
#from
#icon
#id
#created_time
#type
#updated_time
#link
#object_id
#message
#likes
#picture
