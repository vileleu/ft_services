services=(nginx wordpress phpmyadmin mysql ftps grafana influxdb)

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RESET='\033[0m'

declare -i i=0

for name in ${!services[@]}
do
	printf "${BLUE}$i%% ${RESET}${BLUE}. "
	i+=100/${#services[@]}
	kubectl delete -f srcs/deployments/${services[name]}.yaml > /dev/null
	kubectl delete -f srcs/services/${services[name]}.yaml > /dev/null
	printf ". "
	sleep 0.1
	printf ". "
	sleep 0.1
	printf "."
	sleep 0.1
	printf ""
	printf "${BLUE} ${services[name]} service successfully delete\n${RESET}"
done

kubectl delete -f srcs/metallb.yaml > /dev/null

printf "${BLUE}100%${RESET}"

printf "\n${GREEN}----------Clean complete !----------\n${BLUE}"

minikube stop
minikube delete

printf "${RESET}"