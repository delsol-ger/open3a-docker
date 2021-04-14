# open3a-docker
docker application of the free open3a accounting software

exampel RUN command

docker run -d --rm -p 8080:80 -v open3asystem:/var/www/html/system -v open3aspecifics:/var/www/html/specifics --name open3a3.3 open3a3.3
