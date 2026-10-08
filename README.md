# open3a-docker
This is an inofficial docker image of the free open3a accounting software.
It's based on the 8.4-apache image and needs an external database like mysql for the setup.

This is the free version of open3a, there are some paid versions and plugins too, so please support the developers if you like the software.
<a href="https://www.open3a.de/">Official Website</a>

<a href="https://github.com/altima/open3a-docker">Github Project Fork</a> <br>

<a href="https://github.com/delsol-ger/open3a-docker">Github Project</a> <br>
<a href="https://hub.docker.com/r/delsolger/open3a">Docker Hub</a>

## Docker Compose

The repository includes a `docker-compose.yaml` for running open3A with the
required persistent files and directories mounted from the repository.

Before starting the container, make sure these paths exist:

- `conf/Installation.pfdb.php` (an empty file for a new installation)
- `data/specifics/` (for open3A-specific files and plugins)
- `data/backup/` (for backups)

Start open3A from the repository directory:

```bash
docker compose up -d --build
```

Open [http://localhost:8080](http://localhost:8080) and enter the settings for
your external MySQL-compatible database in the web UI. The compose file does
not start a database container.

Useful commands:

```bash
# Follow the open3A logs
docker compose logs -f open3a

# Stop the container without removing its data
docker compose down
```

The compose configuration maps the following host paths into the container:

| Host path | Container path |
| --- | --- |
| `conf/Installation.pfdb.php` | `/var/www/html/system/DBData/Installation.pfdb.php` |
| `data/specifics/` | `/var/www/html/specifics` |
| `data/backup/` | `/var/www/html/system/Backup` |

## Docker Run

The same setup can be started without Compose:

```bash
docker run -d -p 8080:80 \
	-v /mnt/user/open3a/open3asystem/DBData/Installation.pfdb.php:/var/www/html/system/DBData/Installation.pfdb.php \
	-v /mnt/user/open3a/open3aspecifics:/var/www/html/specifics \
	-v /mnt/user/open3a/open3abackup:/var/www/html/system/Backup \
	--name open3a delsolger/open3a
```

## Troubleshooting

If you are getting Database-Errors of missing columns after a version update, make sure to only mount the Installation.pfdb.php file, not the full system folder like in previous versions.
