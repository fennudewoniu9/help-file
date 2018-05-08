#curl -X GET  -o /dev/null  -w %{http_code} --header 'Accept: application/json' 'http://localhost:8082/lilinlin/findById?a=11&b=23'



URL="http://localhost:8082/lilinlin/findById?a=11&b=23" 
REAULT=$(curl -X GET -w %{http_code} --header 'Accept: application/json' $URL)
if [ "200" != "$REAULT" ]
then
 	echo "--------------------------------------------------"
	echo "Found exception when execute shell" 
	echo "--------------------------------------------------"
fi
