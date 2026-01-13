# open3a-docker
This is a docker image of the free open3a accounting software.
It's based on the 7.2-apache image and needs an external database like mysql for the setup.

This is the free version of open3a, there are some paid versions and plugins too, so please support the developers if you like the software.
<a href="https://www.open3a.de/">Official Website</a>

<a href="https://github.com/delsol-ger/open3a-docker">Github Project</a> <br>
<a href="https://hub.docker.com/r/delsolger/open3a">Docker Hub</a>

Create the empty file Installation.pfdb.php
and the empty folder open3aspecifics
to mount into your container

example RUN command

docker run -d -p 8080:80 -v /mnt/user/open3a/open3asystem/DBData/Installation.pfdb.php:/var/www/html/system/DBData/Installation.pfdb.php -v /mnt/user/open3a/open3aspecifics:/var/www/html/specifics --name open3a delsolger/open3a

After this you can setup your database-settings on the web-ui.

