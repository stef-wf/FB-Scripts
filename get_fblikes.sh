#!/bin/bash
filecontent=( `cat "test_logfile" `)   
for fbid in "${filecontent[@]}"
do
echo $fbid 

token='AAABgSEhBMeEBALWyGE0ZCAOu97Yvqb0bAJCQ7Wxb9zr2q5IEafoiLpa95srlZCvNeVrLVfZC90R3S0GlGgjsROOpdMsgW5y2idZCcpcXkQZDZD';

curl "https://graph.facebook.com/$fbid/?access_token=$token" | ruby -e "require 'rubygems'; 
require 'json'; 
data = JSON.parse(gets); 
	print $fbid 
	print ',' 
	print data['name'] 
	print ','  
	print data['likes']
	puts ','
">>likelist.csv

done 

