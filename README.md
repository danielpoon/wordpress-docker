# wordpress-docker

This repo was created to allow developers (me) to deploy Wordpress on their MacBook via Docker quickly and easily. It literally gets your vanilla WP install on your MacBook ready in less than a minute. What's cool is when I was restoring data and I had to do this several iterations, it takes seconds to blow away everything and seconds to bring it all back in one clean slate.

<img width="1225" alt="Screenshot" src="https://github.com/user-attachments/assets/b313ca2a-6b14-428f-98b5-e880594912ca" />

# How?

Install Docker Desktop for Mac: https://docs.docker.com/desktop/setup/install/mac-install/

Install Homebrew: https://brew.sh/ and setup Homebrew

Install Git: 
```
% brew install git
```

Install GitHub Desktop (easier): https://desktop.github.com/download/

Decide where to put it:
```
% mkdir ~/GitHub
% cd ~/GitHub
```
Clone this repo into the directory you created: 
In GitHub Desktop, choose File | Clone Repository: https://github.com/danielpoon/wordpress-docker.git

To deploy, in a terminal:
```
% cd ~/GitHub
% ./setup.sh
```

That's it !!! You can access Wordpress using: http://localhost:8000


# Wordpress Plugins

Some of the plugins I am using:

- Backup Migration - free backup/migration for sites < 2Gb in export size
- Classic Widgets with Block-based Widgets - easier for WP widget manipulation
- Download plugin - to download plugin as files for archive. I archived some WP plugins in zip format for safety reason. 
  https://wordpress.org/plugins/download-plugin/
- File Manager - able to view, archive, delete files I don't normally get to see in the front end e.g. staled plugin folders
- LiteSpeed Cache
- Login with Ajax - allow login to redirect to blog home page or custom page
- LoginPress - customize login page
- Max upload filesize - allow bigger images to be uploaded/processed
- Smush Image Optimization - Image upload and optimize current objects
- WP Extended Search

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
% docker container ls
% docker container rm -f <container ID> <- repeat until all containers have been deleted
% docker volume ls
% docker volume rm wordpress-docker_db_data
% docker volume rm wordpress-docker_wordpress_data
% docker image ls
% docker image rm -f <container ID> <- repeat until all containers have been deleted

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

Put this repo inside OneDrive and have it stored locally and synced/backup online across multiple devices

# Back to Why?

I didn't want to bore you with a manifesto in the beginning, so I will leave it to the end for people who maybe interested.
There are many reasons to host WP locally. Couple of main ones for me were:

* Security: I was getting 100+ failed logins each day. I didn't want to keep dealing with security plugins and worry about when my test site would be hacked. One time, I had a DDoS attack that costed $250 of bandwidth charge.
* Cost: Sure everyone can do a Digital Ocean (DO) site but paying $20/month for Dev isn't really worth it when your MacBook is sitting here idle. But you do want to spin one up faster than DO and have all the backup and safe guard in place. On that end, I let the install sit on OneDrive and won't have to worry about any hardware failure.
* Docker: Containers are life savers, they are much better than VMs because you just need to define a simple dockerfile and docker-compose.yml (what you get in this repo) and you can spin them up in seconds. Space wise, you won't need a 30Gb VM that carries the OS and everything else that makes it hard to take along.

