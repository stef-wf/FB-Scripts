#!/bin/bash
#use this together with get_fbpostid.sh
#this collects reach data for all the posts specified

filecontent=( `cat "postid_logfile" `)    
for line in "${filecontent[@]}"
do


STR_ARRAY=(`echo $line | tr "," "\n"`)
fbid=${STR_ARRAY[0]}
token=${STR_ARRAY[1]}
postid=${STR_ARRAY[2]}

curl "https://graph.facebook.com/$postid/insights/?access_token=$token" | ruby -e "require 'rubygems'; 
require 'json'; 

insights = JSON.parse(gets)

#warning, some metrics have multiple value types, example post_stories_by_action_type has {values: {value: {likes:10, comments:20}}} 


	#pick the metrics you're interested in and replace the index values of the array i 
	for i in [4,6,8,10,14,22,24,25]
		print $fbid
		print ','
		print '${postid}'
		print ','
		print insights['data'][i]['name']
		print ',' 
		print insights['data'][i]['title']
		print ','
		print insights['data'][i]['values'][0]['value']
		puts ''

	end

">>postreach.csv



done 


#post.keys gives us the ff options
#id
#values
#description
#name
#title
#period

#we have these metrics to choose from
#0 post_story_adds_unique
#1 post_story_adds
#2 post_story_adds_by_action_type_unique
#3 post_story_adds_by_action_type
#4 post_impressions_unique
#5 post_impressions
#6 post_impressions_paid_unique
#7 post_impressions_paid
#8 post_impressions_organic_unique
#9 post_impressions_organic
#10 post_impressions_viral_unique
#11 post_impressions_viral
#12 post_impressions_by_story_type_unique        
#15 post_consumptions
#16 post_consumptions_by_type_unique
#17 post_consumptions_by_type
#18 post_negative_feedback_unique
#19 post_negative_feedback
#20 post_negative_feedback_by_type_unique
#21 post_negative_feedback_by_type
#22 post_storytellers
#23 post_storytellers_by_action_type
#24 post_engaged_users
#25 post_stories
#26 post_stories_by_action_type
