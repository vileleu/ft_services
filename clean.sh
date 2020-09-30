services=(nginx wordpress phpmyadmin mysql ftps grafana influxdb)

LIGHTBLUE='\033[1;34m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RESET='\033[0m'

declare -i i=0

for name in ${!services[@]}
do
	echo "${BLUE}$i% / ${RESET}${LIGHTBLUE}. \c"
	i+=100/${#services[@]}
	kubectl delete -f srcs/deployments/${services[name]}.yaml > /dev/null
	kubectl delete -f srcs/services/${services[name]}.yaml > /dev/null
	echo ". \c"
	sleep 0.1
	echo ". \c"
	sleep 0.1
	echo "."
	sleep 0.1
	echo "\r\033[1A\c"
	echo "${LIGHTBLUE} ${services[name]} service successfully delete${RESET}"
done

kubectl delete -f srcs/metallb.yaml > /dev/null

echo "${BLUE}100% /${RESET}"

echo "\n${GREEN}----------Clean complete !----------\n${LIGHTBLUE}"

#rm -rf ip.txt

minikube stop
minikube delete

echo "${RESET}"