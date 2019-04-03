#dep ensure
docker build -t authobot .
rm -rf rootfs
mkdir rootfs
ID=$(docker run -d authobot:latest)
docker export $ID | tar -x -C rootfs
docker kill $ID
docker rm $ID
cd ..
rm -f authobot.tar.gz
tar -czvf authobot.tar.gz authobot
