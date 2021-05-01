services=(influxdb ftps grafana mysql nginx wordpress phpmyadmin)

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

EXTERNAL_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

declare -i i=0

for name in ${!services[@]}
do
	printf "${BLUE}$i%%${RESET}"
	i+=100/${#services[@]}
	kubectl delete -f "srcs/deployments/${services[name]}.yaml" > /dev/null
	kubectl delete -f "srcs/services/${services[name]}.yaml" > /dev/null
	printf "\b\b\b   ${GREEN}${services[name]} service successfully delete\n${RESET}"
done

printf "${BLUE}delete metallb . . .${RESET}"

kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null
kubectl delete -f srcs/configmap.yaml > /dev/null
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null

printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
printf "${BLUE}100%%                ${RESET}"

printf "\n${GREEN}----------Clean complete !----------\n${BLUE}"

minikube stop
minikube delete

sed -i "s/"$EXTERNAL_IP"/"EXTERNAL_IP"/g" srcs/configmap.yaml
sed -i "s/"$EXTERNAL_IP"/"EXTERNAL_IP"/g" srcs/nginx/site.conf
sed -i "s/"$EXTERNAL_IP"/"EXTERNAL_IP"/g" srcs/mysql/wp.sql
sed -i "s/"$EXTERNAL_IP"/"EXTERNAL_IP"/g" srcs/ftps/vsftpd.conf

printf "${RESET}"