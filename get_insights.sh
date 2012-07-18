#!/bin/bash
filecontent=( `cat "insights_logfile" `)    
for line in "${filecontent[@]}"
do

#insights_logfile must contain four pieces of information separated by commas. fbid, access token, start date, and end date
#date format =>  2011-01-01 

STR_ARRAY=(`echo $line | tr "," "\n"`)
fbid=${STR_ARRAY[0]}
token=${STR_ARRAY[1]}
start_date=${STR_ARRAY[2]}
end_date=${STR_ARRAY[3]}

curl "https://graph.facebook.com/$fbid/insights/?since=$start_date&until=$end_date/access_token=$token" | ruby -e "require 'rubygems'; 
require 'json'; 



insights = JSON.parse(gets);
		#this outputs all the page post impression data
		for index in 99..122  
			print insights['data'][index]['id'].split('/').first
			print ',' 
			print insights['data'][index]['title']
			print ',' 
			print insights['data'][index]['name']
			print ',' 
			print insights['data'][index]['period']
			print ','			
			insights['data']['values'].each do |value|
				print value['end_time']
				print ','
				print value['value']
				print ',' 
			end	
			puts ' '
		end
		
">>insights.csv

done

#READ ME
#place the facebook id and access token, separated by a comma, in insights_logfile 

#There are 195 possible items we can access through Insights. Here's a list with indices. I'm only interested in post impressions 99-122, hence the for loop above

#0 page_fan_adds_unique day 
#1 page_fan_adds day 
#2 page_fan_removes_unique day 
#3 page_fan_removes day 
#4 page_views_login_unique day 
#5 page_views_login_unique week 
#6 page_views_login day 
#7 page_views_login week 
#8 page_views_logout day 
#9 page_views day 
#10 page_tab_views_login_top_unique day 
#11 page_tab_views_login_top_unique week 
#12 page_tab_views_login_top day 
#13 page_tab_views_login_top week 
#14 page_tab_views_logout_top day 
#15 page_views_internal_referrals day 
#16 page_views_external_referrals day 
#17 page_story_adds_unique day 
#18 page_story_adds_unique week 
#19 page_story_adds_unique days_28 
#20 page_story_adds day 
#21 page_story_adds week 
#22 page_story_adds days_28 
#23 page_story_adds_by_story_type_unique day 
#24 page_story_adds_by_story_type_unique week 
#25 page_story_adds_by_story_type_unique days_28 
#26 page_story_adds_by_story_type day 
#27 page_story_adds_by_story_type week 
#28 page_story_adds_by_story_type days_28 
#29 page_impressions_by_age_gender_unique day 
#30 page_impressions_by_age_gender_unique week 
#31 page_impressions_by_age_gender_unique days_28 
#32 page_impressions_by_country_unique day 
#33 page_impressions_by_country_unique week 
#34 page_impressions_by_country_unique days_28 
#35 page_impressions_by_locale_unique day 
#36 page_impressions_by_locale_unique week 
#37 page_impressions_by_locale_unique days_28 
#38 page_impressions_by_city_unique day 
#39 page_impressions_by_city_unique week 
#40 page_impressions_by_city_unique days_28 
#41 page_story_adds_by_age_gender_unique day 
#42 page_story_adds_by_age_gender_unique week 
#43 page_story_adds_by_age_gender_unique days_28 
#44 page_story_adds_by_country_unique day 
#45 page_story_adds_by_country_unique week 
#46 page_story_adds_by_country_unique days_28 
#47 page_story_adds_by_city_unique day 
#48 page_story_adds_by_city_unique week 
#49 page_story_adds_by_city_unique days_28 
#50 page_story_adds_by_locale_unique day 
#51 page_story_adds_by_locale_unique week 
#52 page_story_adds_by_locale_unique days_28 
#53 page_impressions_unique day 
#54 page_impressions_unique week 
#55 page_impressions_unique days_28 
#56 page_impressions day 
#57 page_impressions week 
#58 page_impressions days_28 
#59 page_impressions_paid_unique day 
#60 page_impressions_paid_unique week 
#61 page_impressions_paid_unique days_28 
#62 page_impressions_paid day 
#63 page_impressions_paid week 
#64 page_impressions_paid days_28 
#65 page_impressions_organic_unique day 
#66 page_impressions_organic_unique week 
#67 page_impressions_organic_unique days_28 
#68 page_impressions_organic day 
#69 page_impressions_organic week 
#70 page_impressions_organic days_28 
#71 page_impressions_viral_unique day 
#72 page_impressions_viral_unique week 
#73 page_impressions_viral_unique days_28 
#74 page_impressions_viral day 
#75 page_impressions_viral week 
#76 page_impressions_viral days_28 
#77 page_impressions_by_story_type_unique day 
#78 page_impressions_by_story_type_unique week 
#79 page_impressions_by_story_type_unique days_28 
#80 page_impressions_by_story_type day 
#81 page_impressions_by_story_type week 
#82 page_impressions_by_story_type days_28 
#83 page_places_checkin_total day 
#84 page_places_checkin_total week 
#85 page_places_checkin_total days_28 
#86 page_places_checkin_total_unique day 
#87 page_places_checkin_total_unique week 
#88 page_places_checkin_total_unique days_28 
#89 page_places_checkin_mobile day 
#90 page_places_checkin_mobile week 
#91 page_places_checkin_mobile days_28 
#92 page_places_checkin_mobile_unique day 
#93 page_places_checkin_mobile_unique week 
#94 page_places_checkin_mobile_unique days_28 
#95 page_places_checkins_by_age_gender day 
#96 page_places_checkins_by_country day 
#97 page_places_checkins_by_city day 
#98 page_places_checkins_by_locale day 
#99 page_posts_impressions_unique day 
#100 page_posts_impressions_unique week 
#101 page_posts_impressions_unique days_28 
#102 page_posts_impressions day 
#103 page_posts_impressions week 
#104 page_posts_impressions days_28 
#105 page_posts_impressions_paid_unique day 
#106 page_posts_impressions_paid_unique week 
#107 page_posts_impressions_paid_unique days_28 
#108 page_posts_impressions_paid day 
#109 page_posts_impressions_paid week 
#110 page_posts_impressions_paid days_28 
#111 page_posts_impressions_organic_unique day 
#112 page_posts_impressions_organic_unique week 
#113 page_posts_impressions_organic_unique days_28 
#114 page_posts_impressions_organic day 
#115 page_posts_impressions_organic week 
#116 page_posts_impressions_organic days_28 
#117 page_posts_impressions_viral_unique day 
#118 page_posts_impressions_viral_unique week 
#119 page_posts_impressions_viral_unique days_28 
#120 page_posts_impressions_viral day 
#121 page_posts_impressions_viral week 
#122 page_posts_impressions_viral days_28 
#123 page_consumptions_unique day 
#124 page_consumptions_unique week 
#125 page_consumptions_unique days_28 
#126 page_consumptions day 
#127 page_consumptions week 
#128 page_consumptions days_28 
#129 page_consumptions_by_consumption_type_unique day 
#130 page_consumptions_by_consumption_type_unique week 
#131 page_consumptions_by_consumption_type_unique days_28 
#132 page_consumptions_by_consumption_type day 
#133 page_consumptions_by_consumption_type week 
#134 page_consumptions_by_consumption_type days_28 
#135 page_fans_by_like_source_unique day 
#136 page_fans_by_like_source day 
#137 page_negative_feedback_unique day 
#138 page_negative_feedback_unique week 
#139 page_negative_feedback_unique days_28 
#140 page_negative_feedback day 
#141 page_negative_feedback week 
#142 page_negative_feedback days_28 
#143 page_negative_feedback_by_type_unique day 
#144 page_negative_feedback_by_type_unique week 
#145 page_negative_feedback_by_type_unique days_28 
#146 page_negative_feedback_by_type day 
#147 page_negative_feedback_by_type week 
#148 page_negative_feedback_by_type days_28 
#149 page_fans lifetime 
#150 page_fans_locale lifetime 
#151 page_fans_city lifetime 
#152 page_fans_country lifetime 
#153 page_fans_gender lifetime 
#154 page_fans_age lifetime 
#155 page_fans_gender_age lifetime 
#156 page_friends_of_fans day 
#157 page_storytellers day 
#158 page_storytellers week 
#159 page_storytellers days_28 
#160 page_storytellers_by_story_type day 
#161 page_storytellers_by_story_type week 
#162 page_storytellers_by_story_type days_28 
#163 page_storytellers_by_age_gender day 
#164 page_storytellers_by_age_gender week 
#165 page_storytellers_by_age_gender days_28 
#166 page_storytellers_by_country day 
#167 page_storytellers_by_country week 
#168 page_storytellers_by_country days_28 
#169 page_storytellers_by_city day 
#170 page_storytellers_by_city week 
#171 page_storytellers_by_city days_28 
#172 page_storytellers_by_locale day 
#173 page_storytellers_by_locale week 
#174 page_storytellers_by_locale days_28 
#175 page_engaged_users day 
#176 page_engaged_users week 
#177 page_engaged_users days_28 
#178 page_impressions_frequency_distribution day 
#179 page_impressions_frequency_distribution week 
#180 page_impressions_frequency_distribution days_28 
#181 page_impressions_viral_frequency_distribution day 
#182 page_impressions_viral_frequency_distribution week 
#183 page_impressions_viral_frequency_distribution days_28 
#184 page_posts_impressions_frequency_distribution day 
#185 page_posts_impressions_frequency_distribution week 
#186 page_posts_impressions_frequency_distribution days_28 
#187 page_views_unique day 
#188 page_views_unique week 
#189 page_stories day 
#190 page_stories week 
#191 page_stories days_28 
#192 page_stories_by_story_type day 
#193 page_stories_by_story_type week 
#194 page_stories_by_story_type days_28 
