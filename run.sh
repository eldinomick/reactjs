result=${PWD##*/}
res=${PWD}
docker kill $result
docker rm $result
docker run -d -p 3000:3000 \
    --name $result \
    -v $res:/app \
cadotinfo/docker-reactjs
