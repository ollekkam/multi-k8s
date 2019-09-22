docker build -t ollekkam1/k8s:multi-client-latest -t ollekkam1/k8s:multi-client-$SHA -f ./client/Dockerfile ./client
docker build -t ollekkam1/k8s:multi-server-latest -t ollekkam1/k8s:multi-server-$SHA -f ./server/Dockerfile ./server
docker build -t ollekkam1/k8s:multi-worker-latest -t ollekkam1/k8s:multi-worker-$SHA -f ./worker/Dockerfile ./worker
docker push ollekkam1/k8s:multi-client-latest
docker push ollekkam1/k8s:multi-server-latest
docker push ollekkam1/k8s:multi-worker-latest
docker push ollekkam1/k8s:multi-client-$SHA
docker push ollekkam1/k8s:multi-server-$SHA
docker push ollekkam1/k8s:multi-worker-$SHA

kubectl apply -f k8s

kubectl set image deployment/server-deployment server=ollekkam1/k8s:multi-server-$SHA
kubectl set image deployment/client-deployment client=ollekkam1/k8s:multi-client-$SHA
kubectl set image deployment/worker-deployment worker=ollekkam1/k8s:multi-worker-$SHA

