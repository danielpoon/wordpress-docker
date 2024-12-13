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

Access Wordpress using: http://localhost:8000

# Support Commands

Check if its up: '''docker-compose ps'''
Start container: '''docker-compose up -d'''
Stop container: '''docker-compose down'''
Update image: '''docker-compose pull'''

More info: https://flywp.com/blog/8593/local-wordpress-development-environment/
Or: https://catalins.tech/how-to-run-wordpress-locally-on-macos-with-docker-compose/



