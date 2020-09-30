services="nginx wordpress phpmyadmin mysql ftps grafana influxdb"

GREEN='\033[0;32m'
LIGHT_BLUE='\033[0;34m'
RESET='\033[0m'

create_img ()
{
	echo "${LIGHT_BLUE}Create image $1 .\c${RESET}"
	docker build -t service_$1 srcs/$1 > /dev/null
	echo " .\c"
	sleep 1
	echo " ."
	sleep 1
	echo "${GREEN} $1 image successfully built\n${RESET}"
}

create_deployments ()
{
	echo "${LIGHT_BLUE}Deploy $1 .\c${RESET}"
	kubectl apply -f srcs/deployments/$1.yaml > /dev/null
	echo " .\c"
	sleep 1
	echo " ."
	sleep 1
	echo "${GREEN} $1 successfully deploy\n${RESET}"
}

create_services ()
{
	echo "${LIGHT_BLUE}Create service $1 .\c${RESET}"
	kubectl apply -f srcs/services/$1.yaml > /dev/null
	echo " .\c"
	sleep 1
	echo " ."
	sleep 1
	echo "${GREEN} $1 service successfully built\n${RESET}"
}

minikube --vm-driver=docker start

minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f srcs/metallb.yaml

for serv in $services
do
		create_img $serv
done

echo "${GREEN}\n---Alls images have been created---\n\n${RESET}"

for serv in $services
do
		create_services $serv
done

echo "${GREEN}\n---Alls services are setup---\n\n${RESET}"

for serv in $services
do
		create_deployments $serv
done

echo "${GREEN}\n---Deployments complete---\n\n${RESET}"

#ADR=$(kubectl get node -o wide | grep -v INTERNAL-IP)
#./find_ip "${ADR}"
#printf "IP = $(cat ip.txt)\n"

kubectl get services
kubectl get pod

minikube dashboard