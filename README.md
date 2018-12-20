# Showtime Assignment Readme - Ryan Kwon

For this assignment, all files are located in the Showtime Assignment folder. And in each folder, I've created folders "1" and "2" to correspond to the tasks respectively. 

# Number 1 - Setup a PHP environment with your choice of web server

For this task, I've chosen to use Docker for its ease of building and deployment. I'm using the latest PHP image (7.3.0) from Docker hub with Apache for the web server. 

## Steps

Prerequisites:
1. Install Docker (please refer to: https://docs.docker.com/install/)
2. Make sure Docker is running and installed correctly

The easiest way to deploy the environment is to simply pull my ready-to-go php showtime demo image from docker hub and run that:
```
docker pull rykwon95/php-showtime-demo
docker run -d -p 8000:80 --name my-running-app rykwon95/php-showtime-demo (or any other run configuration)
```

Otherwise, you can use the files in the "1" folder which include the Dockerfile and the php files to build an image from the php apache base image and run that.

Example:
```
docker build -t my-php-app . 
docker run -d -p 8000:80 --name my-running-app my-php-app
```

**my-php-app is the name of the image to be built with the Dockerfile
Don't forget the dot "." at the end of the build command to indicate current directory**


## After container is created and running
Verify the environment by going to localhost:8000 (if other run configuration was used, port number will be different) and you should see a page that says "Hello World". You can verify php configuration for sys_temp_dir and error_log file by going to localhost:8000/phpinfo.php. 

# Number 2 - Bash Script

This bash script should get concatenate all txt files in a given directory, then group them by IP, and sort them within their group by the time and date

## Steps
In the "2" folder is a bash script called ryan.kwon.sh. 
If you're in the folder in the command line, you can run the script by running:
`./ryan.kwon.sh [path to folder with txt files] [path to folder where you want the output file]`

Note: It may need to have executable permissions if the appropriate permissions are not set:
`chmod +x ryan.kwon.sh`
