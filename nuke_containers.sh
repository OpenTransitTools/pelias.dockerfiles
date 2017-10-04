# 
./stop_services.sh STOP_ES

docker ps --all --quiet --no-trunc --filter "status=exited" | xargs --no-run-if-empty docker rm
docker images --quiet --filter "dangling=true" | xargs --no-run-if-empty docker rmi
docker rmi -f $(docker images | awk '{print $3}' | grep -v IMAGE)
docker volume ls | awk '{print $2}' | xargs docker volume rm

docker ps
echo
echo
docker images
echo
echo
docker volume ls
echo
echo

echo ssh $USER_NAME@$HOSTNAME
echo sudo su
echo rm -rf $DATA_DIR[c-z]\*
echo