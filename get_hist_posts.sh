#!/bin/bash
filecontent=( `cat "post_hist_logfile" `)    
for fbid in "${filecontent[@]}"
do
echo $fbid 

start_date='2011-02-01';
end_date='2011-03-01';

curl "https://graph.facebook.com/$fbid/posts/?since=$start_date&until=$end_date&access_token=AAABgSEhBMeEBALWyGE0ZCAOu97Yvqb0bAJCQ7Wxb9zr2q5IEafoiLpa95srlZCvNeVrLVfZC90R3S0GlGgjsROOpdMsgW5y2idZCcpcXkQZDZD" | ruby -e "require 'rubygems'; 
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

		#when there are no shares, FB doesn't even have the decency to put shares count = 0
		if post['shares'].nil? 
			print '0,'
		else 
			print post['shares']['count'].to_s + ','
		end
		puts ''
	}

">>posthist.csv

done