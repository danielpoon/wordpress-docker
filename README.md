# wordpress-docker

This repo was created to allow developers to deploy Wordpress on their MacBook via Docker easily.

# How?

Install Docker Desktop for Mac: https://docs.docker.com/desktop/setup/install/mac-install/

Install Homebrew: https://brew.sh/ and setup Homebrew

Install Git: 
```
% brew install git
```
Install Git Desktop: https://desktop.github.com/download/

Clone this repo: 
File | Clone Repository: https://github.com/danielpoon/wordpress-docker.git
```
% ./setup.sh
```

That's it !!! You can access Wordpress using: http://localhost:8000


# Wordpress Plugins

Some of the plugins I am using:

- php_info() - show PHP info
- LiteSpeed Cache - faster page refresh
- LoginPress - customize login page
- WP Extended Search - better search
- EWWW Image Optimizer - make images smaller
- Max upload filesize - allow bigger images to be uploaded/processed

# Support Commands

Check if its up: 
```docker-compose ps```

Start container: 
```docker-compose up -d```

Stop container: 
```docker-compose down```

Update image: 
```docker-compose pull```

More info: https://flywp.com/blog/8593/local-wordpress-development-environment/

Or: https://catalins.tech/how-to-run-wordpress-locally-on-macos-with-docker-compose/

# Start from Scratch

The wordpress and DB data will persist in your local drive as expected. But there maybe times when you want to wipe all the data and start from scratch:

```
% docker-compose down
% docker volume ls
% docker volume rm wordpress_db_data
% docker volume rm wordpress_wordpress_data
% docker container ls
% docker container rm -f <container ID> <- repeat until all containers have been deleted
% ./setup.sh
```

Access Wordpress using http://localhost:8000

# Edit Wordpress Config inside Container

If you want to get inside the container and make some changes:
```
1. % docker-compose ps
   Note down the container ID
2. % docker container exec -it 2d3cf8912265 bash
```

# Other Ideas

Put this repo inside OneDrive and have it stored locally and synced/backup online across devices

