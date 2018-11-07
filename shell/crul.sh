#curl -X GET  -o /dev/null  -w %{http_code} --header 'Accept: application/json' 'http://localhost:8082/t9/findById?a=11&b=23'



URL="http://localhost:8082/t9/findById?a=11&b=23"
REAULT=$(curl -X GET -w %{http_code} --header 'Accept: application/json' $URL)
if [ "200" != "$REAULT" ]
then
 	echo "--------------------------------------------------"
	echo "Found exception when execute shell" 
	echo "--------------------------------------------------"
fi



curl -X POST -H 'Content-Type: application/json' --data '{"data":"1"}' http://wwwtest4.com
curl -X GET --header 'Accept: application/json' 'http://localhost:10080/tencent-im/update_gender_avatar?start=0'




上海电信DNS：202.96.209.133 53
Host：116.228.30.172