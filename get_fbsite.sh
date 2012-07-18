#!/bin/bash
filecontent=( `cat "logfile" `)   
for fbid in "${filecontent[@]}"
do
echo $fbid 

curl "https://graph.facebook.com/$fbid/?access_token=AAACPV5STJJIBAIfHaMaX7oEj96VwZCSIzGpnN1O9zNY9cp8GzNJwDOscUaihSqmiFJiQGadw6T3Am3FTZBfI6vIjVVqapKFUZAbrENWiwZDZD" | ruby -e "require 'rubygems'; 
require 'json'; 
data = JSON.parse(gets); 
	websites = data['website'].split(' ') ; 
	websites.each { |x|
		puts data['id'] + ',' + data['name'] + ',' + data['username'] +  ',' + x}
">>weblist.csv

done 


#pretty simple. outputs one line per website as per BizOps request. 
#output format: 
# 102, Nike Sports, nikesports, www.nikesports.com
# 102, Nike Sports, nikesports, www.nike.com
