nohup java -jar bms.jar --spring.cloud.config.profile=local --spring.cloud.config.uri=http://10.199.212.117:13888 > logs/bms.log &


"----------------------------------------------------------------------------------------------------"
curl -X GET --header 'Accept: application/json' 'http://localhost:8082/lilinlin/findById?a=11&b=23'
curl -X GET --header 'Accept: application/json' 'http://localhost:8082/lilinlin/findById?a=11&b=23'

if [ "200" != "$(curl -sLI -w "%{http_code}\\n" -o /dev/null http://localhost:8082/lilinlin/findById?a=11&b=23)" ]
then
        echo "--------------------------------------------------"
        echo "Found exception when execute shell" 
        echo "--------------------------------------------------"
fi
"----------------------------------------------------------------------------------------------------"
URL="http://localhost:8082/lilinlin/findById?a=11&b=23" 
REAULT=$(curl -X GET -w %{http_code} --header 'Accept: application/json' $URL)
if [ "200" != "$REAULT" ]
then
 	echo "--------------------------------------------------"
	echo "Found exception when execute shell" 
	echo "--------------------------------------------------"
fi
"----------------------------------------------------------------------------------------------------"

















"----------------------------------------------------------------------------------------------------"
Jenkins配置:
	源码管理：
		Git：
	 		Repository URL：http://10.121.19.101/be-sys/bms.git
			Credentials：
			Branch Specifier (blank for 'any')	：*/master
	构建：
		Execute shell:
			Command:mvn -X clean package -DskipTests -Dmaven.test.skip=true 

	构建后操作:
		send build artifacts over SSH:
			SSH Publishers:
				Name:10.199.212.117
				Transfers:
					Source files: be-bms/target/be-bms-0.0.1-SNAPSHOT.jar
					Remove prefix: be-bms/target
					Remote directory: be-deploy/be-bms
					Exec command:
									cd be-deploy/be-bms
									ps -ef | grep bms.jar | grep -v grep | awk '{print $2}' | xargs -I {} kill -9 {} 
									# copy bms.jar
									if [ -L bms.jar ]; then
									  rm -rf bms.jar
									fi
									if [ -f be-bms-*-SNAPSHOT.jar ]; then
										ln -s be-bms-*-SNAPSHOT.jar bms.jar
									nohup java -jar bms.jar --spring.cloud.config.profile=local --spring.cloud.config.uri=http://10.199.212.117:13888 > logs/bms.log &
									fi
"----------------------------------------------------------------------------------------------------"










