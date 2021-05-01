services="influxdb ftps grafana mysql nginx wordpress phpmyadmin"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

create_img ()
{
	printf "${BLUE}Create image $1 . . .${RESET}"
	docker build -t service_$1 srcs/$1
	printf "${GREEN} $1 image successfully built\n${RESET}"
}

create_services ()
{
	printf "${BLUE}Create service $1 . . .${RESET}"
	kubectl apply -f srcs/services/$1.yaml > /dev/null
	printf "${GREEN} $1 service successfully built\n${RESET}"
}

create_deployments ()
{
	printf "${BLUE}Deploy $1 . . .${RESET}"
	kubectl apply -f srcs/deployments/$1.yaml > /dev/null
	printf "${GREEN} $1 successfully deploy\n${RESET}"
}

minikube start driver=docker

EXTERNAL_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

sed -i "s/"EXTERNAL_IP"/"$EXTERNAL_IP"/g" srcs/configmap.yaml
sed -i "s/"EXTERNAL_IP"/"$EXTERNAL_IP"/g" srcs/nginx/site.conf
sed -i "s/"EXTERNAL_IP"/"$EXTERNAL_IP"/g" srcs/mysql/wp.sql
sed -i "s/"EXTERNAL_IP"/"$EXTERNAL_IP"/g" srcs/ftps/vsftpd.conf

minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

for serv in $services
do
		create_img $serv
done

printf "${GREEN}\n---Alls images have been created---\n\n${RESET}"

for serv in $services
do
		create_services $serv
done

printf "${GREEN}\n---Alls services are setup---\n\n${RESET}"

for serv in $services
do
		create_deployments $serv
done

printf "${GREEN}\n---Deployments complete---\n\n${RESET}"

printf "${BLUE}Deploy Metallb . . .${RESET}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null
printf " ${GREEN}"
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/configmap.yaml > /dev/null
printf " Metallb successfully deploy\n${RESET}"

minikube dashboard & sleep 10