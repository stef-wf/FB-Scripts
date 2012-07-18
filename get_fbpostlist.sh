#!/bin/bash
#use this together with get_fbpost_insights.sh
#this collects the ids of the last 10 

filecontent=( `cat "insights_logfile" `)    
for line in "${filecontent[@]}"
do
	
STR_ARRAY=(`echo $line | tr "," "\n"`)
fbid=${STR_ARRAY[0]}
token=${STR_ARRAY[1]}

num_posts="10";

curl "https://graph.facebook.com/$fbid/posts/?access_token=$token&limit=$num_posts" | ruby -e "require 'rubygems'; 
require 'json'; 

data = JSON.parse(gets); 

data['data'].each { |post| 
	#might be too preemptive
	if post['id'].nil?
		print '' 
	else 
		print '${fbid}'
		print ','
		print '${token}'
		print ','
		print post['id']
		puts ''
	end
}

">>postid_logfile


done 