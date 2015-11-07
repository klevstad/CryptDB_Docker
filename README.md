# TTM 4501 @ The Norwegian University of Science and Technology

##### This project is about investigaing the encryption database CryptDB developed at MIT in 2011.

###### Sourcecode and Dockerfile has been cloned from quickbundle (Bai Xiaoyong)

### How to run:

##### 1. Make sure to have Docker installed

http://docs.docker.com/v1.8/installation/

##### 2. Clone project and navigate to root

Easy.

##### 3. Build docker image

sudo docker build -t NAME OF IMAGE:VERSION .

Example: sudo docker build -t cryptdb:v1

##### 4. Run docker container based built image

sudo docker run -it -P --name NAME_OF_CONTAINER NAME_OF_IMAGE:VERSION

Example: sudo docker run -it -P --name cryptdb_test cryptdb:v1

##### 5. For accessing a docker container, use

sudo docker exec -it NAME_OF_CONTAINER bash
