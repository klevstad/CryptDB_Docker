##### This project is about investigating the encryption database [CryptDB](https://css.csail.mit.edu/cryptdb/) developed at MIT in 2011.

###### Sourcecode and Dockerfile are forked from quickbundle (Bai Xiaoyong)

## How to setup:

##### 1. Make sure to have Docker installed

http://docs.docker.com/v1.8/installation/

###### This setup is for Linux. For OS X install use Docker Toolbox and skip the sudo part of the commands.

##### 2. Create a folder, clone project and navigate to folder containing the Dockerfile

git clone https://github.com/klevstad/TTM4501-demo.git

##### 3. Build docker image

sudo docker build -t NAME_OF_IMAGE:VERSION .

Example: sudo docker build -t cryptdb:v1

##### 4. Run docker container based built image

sudo docker run -d --name NAME_OF_CONTAINER -p PORT_INN:PORT_OUT -p PORT_INN:PORT_OUT NAME_OF_IMAGE:VERSION

Example: sudo docker run -d --name cryptdb -p 3306:3306 -p 3307:3307 cryptdb:v1

##### 5. For accessing a docker container, use

sudo docker exec -it NAME_OF_CONTAINER bash



## How to play around:


##### [ Terminal 1: Proxy Server ] Start the proxy server (enter container first):

/opt/cryptdb.sh start

(for stopping the proxy server: /opt/cryptdb.sh stop)


##### [ Terminal 2: MYSQL Client ] Query database through proxy server(enter container first):

mysql -u root -pletmein -h 127.0.0.1 -P 3307

###### Create a database, use it, create tables, etc. Observe that the proxy server intercepts the queries and rewrites them. Also, the data is in plaintext and readable for the logged-in user.


##### [ Terminal 3: The Snooping Database Administrator ] Open the database without going through the proxy server.(enter container first)

mysql -u root -pletmein -h 127.0.0.1

(default port is 3306)

###### Snoop around in the database. Observe that all the data is encrypted and impossible for you to decrypt.
