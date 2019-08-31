docker build -t rickywraith/containers-client:latest -t rickywraith/containers-client:$SHA -f ./src/src/client/Dockerfile ./src/src/client
docker build -t rickywraith/containers-worker:latest -t rickywraith/containers-worker:$SHA -f ./src/src/worker/Dockerfile ./src/src/worker
docker build -t rickywraith/containers-server:latest -t rickywraith/containers-server:$SHA -f ./src/src/server/Dockerfile ./src/src/server
docker push rickywraith/containers-client:latest
docker push rickywraith/containers-worker:latest
docker push rickywraith/containers-server:latest
docker push rickywraith/containers-client:$SHA
docker push rickywraith/containers-worker:$SHA
docker push rickywraith/containers-server:$SHA
kubectl apply -f .
kubectl set image deployments/client-deployment client=rickywraith/containers-client:$SHA
kubectl set image deployments/worker-deployment worker=rickywraith/containers-worker:$SHA
kubectl set image deployments/server-deployment server=rickywraith/containers-server:$SHA
