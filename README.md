##### This project is about investigating the encrypted database [CryptDB](https://css.csail.mit.edu/cryptdb/) developed at MIT in 2011.

## How to setup:

##### 1. Make sure to have Docker installed

http://docs.docker.com/v1.8/installation/

###### This setup is for Linux. For OS X and Windows, install Docker Toolbox and skip the sudo part of the commands.

##### 2. Create a folder, clone project and navigate to folder containing the Dockerfile

    git clone https://github.com/agribu/CryptDB_Docker.git

##### 3. Build docker image

    sudo docker build -t **name-of-image**:**version** **.**

    #Example:
    sudo docker build -t cryptdb:v1 .
    
    #To build without caching use:
    sudo docker build --no-cache=true -t cryptdb:v1 .

(Open the Docker Quickstart Terminal if OS X or Windows)

##### 4. Run docker container based built image

    sudo docker run -d --name **name-of-container** -p **port-in**:**port-out** -p **port-in**:**port-out** -e MYSQL_ROOT_PASSWORD='letmein' **name-of-image**:**version**

    #Example:
    sudo docker run -d --name cryptdb -p 3306:3306 -p 3307:3307 -e MYSQL_ROOT_PASSWORD='letmein' cryptdb:v1

(Important: The password must be 'letmein')

##### 5. For accessing a docker container, use

    sudo docker exec -it **name-of-container** bash

    #Example:
    sudo docker exec -it cryptdb bash

## CryptDB shell via docker exec:
    #Starting cryptdb shell
    docker exec -it cryptdb cryptdb start
    
    #Stopping cryptdb shell
    docker exec -it cryptdb cryptdb stop


## How to play around:


##### [ Terminal 1: Proxy Server ] Start the proxy server (enter container first):

    /opt/cryptdb.sh start

    # For stopping the proxy server: /opt/cryptdb.sh stop


##### [ Terminal 2: MYSQL Client ] Query database through proxy server(enter container first):

    mysql -u root -pletmein -h 127.0.0.1 -P 3307

###### Create a database, use it, create tables, etc. Observe that the proxy server intercepts the queries and rewrites them. Also, the data is in plaintext and readable for the logged-in user.


##### [ Terminal 3: The Snooping Database Administrator ] Open the database without going through the proxy server.(enter container first)

    mysql -u root -pletmein -h 127.0.0.1

    # default port is 3306

###### Snoop around in the database. Observe that all the data is encrypted and impossible for you to decrypt.

### Final notes

* This Dockerfile uses Debian wheezy and therefore runs mysql-server version 5.5.
