# open3a-docker
This is a docker image of the free open3a accounting software.
It's based on the 7.2-apache image and needs an external database like mysql for the setup.

This is the free version of open3a, there are some paid versions and plugins too, so please support the developers if you like the software.
<a href="https://www.open3a.de/">Official Website</a>

<a href="https://github.com/delsol-ger/open3a-docker">Github Project</a>
<a href="https://hub.docker.com/r/delsolger/open3a">Docker Hub</a>

example RUN command

docker run -d --rm -p 8080:80 -v open3asystem:/var/www/html/system -v open3aspecifics:/var/www/html/specifics --name open3a3.3 open3a3.3

After this you can setup your database-settings on the web-ui.

