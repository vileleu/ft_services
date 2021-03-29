services="nginx wordpress phpmyadmin mysql ftps grafana influxdb"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

create_img ()
{
	printf "${BLUE}Create image $1 . . .${RESET}"
	docker build -t service_$1 srcs/$1 > /dev/null
	printf "${GREEN} $1 image successfully built\n${RESET}"
}

create_deployments ()
{
	printf "${BLUE}Deploy $1 . . .${RESET}"
	kubectl apply -f srcs/deployments/$1.yaml > /dev/null
	printf "${GREEN} $1 successfully deploy\n${RESET}"
}

create_services ()
{
	printf "${BLUE}Create service $1 . . .${RESET}"
	kubectl apply -f srcs/services/$1.yaml > /dev/null
	printf "${GREEN} $1 service successfully built\n${RESET}"
}

minikube start --driver=docker

minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

printf "${BLUE}Deploy Load balancer . . .${RESET}"
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml > /dev/null
kubectl apply -f srcs/metallb.yaml > /dev/null
printf "${GREEN} $1 Metallb successfully deploy\n${RESET}"

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

#kubectl get services
#kubectl get pod

minikube dashboard