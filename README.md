# Polynote Windows Inofficial (current versions 0.3+)
[Official Polynote Repository](https://github.com/polynote/polynote)

The script provided allows to run the latest Polynote Versions on Windows. It is currently tested on version ```0.3.11 (August 19, 2020)```.

## Prerequisits
In order to run the batch script you need to have docker and docker-compose installed. docker-compose is included in [Docker Desktop](https://docs.docker.com/docker-for-windows/install/).
Everything else will be installed and loaded during the build phase.

## Execution
You can either execute the batch script or issue the commands included manually. The batch script updates polynote and starts the container. If you don't want to update Polynote you can simply type ```docker-compose up``` in the directory of ```docker-compose.yml```
To stop the container just press ctrl+c in the command line.
Note: For the first time executing you must use the batch script or type ```docker-compose build``` followed by ```docker-compose up```.

## Usage
After starting the container you can access Polynote on [http://localhost:8192](http://localhost:8192)

## Editing
Adding packages can be done by editing the ```requirements.txt``` file. The requirements are added in the build process via pip, so make sure to run ```docker-compose build``` or the batch script after adding your requirements to the file.

## Notebook Storage
docker-compose mounts a (new) folder named ```./notebooks``` to the container in which the notebooks are stored. Thus, the notebooks are persisted outside the container and can be shared or used after updated Polynote. If you want to change this directory you can edit the path in ```docker-compose.yml``` under ```volumes```.

## Credit
Big parts of the Dockerfile are based on [Vilos92's inofficial docker image](https://github.com/Vilos92/polynote).
