docker build -t ollekkam1/k8s/multi-client -f ./client/Dockerfile ./client
docker build -t ollekkam1/k8s/multi-server -f ./server/Dockerfile ./server
docker build -t ollekkam1/k8s/multi-worker -f ./worker/Dockerfile ./worker
docker push ollekkam1/k8s/multi-client
docker push ollekkam1/k8s/multi-server
dokcer push ollekkam1/k8s/multi-worker
kubectl apply -f k8s

