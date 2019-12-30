<br/><br/><br/><br/><br/><br/>
<h1 align=center>SaPCoCS Report</h1>
<h2 align=center>Object detection algorithm with use of docker <br/>and Jupyter notebook</h2>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <h3>Author: Ismoil Atajanov</h3>
  <br/><br/><br/><br/><br/><br/><br/><br/>
  
## Task description
- The task was to run a object detection example from [Tensorflow Hub](https://github.com/tensorflow/hub.git) using Jupyter notebook running on a docker container.
- The whole process is presented in 4 steps in a form of a manual, which will explain how it was done as well as allow someone to recreate the same process by completing a few short steps.
------
## Tools
1. Ubutnu v.18.04
2. VMBox
3. Docker
4. Jupyter notebook
------
## Files
1. docker-install.sh 
  - A short shell script for automatic docker installation, simply loading an open source installation script and executing it.
2. Dockerfile
  - A Dockerfile contains all the commands a user could call on the command line to assemble an image. The file contains all the commands necessary to prepare a working docker container with jupyter notebook
------
## Steps
1. Create a new ubuntu virtual machine and run it
2. Install docker.
3. Setup and run docker container.
4. Run the object detection example with a desired image.
------
## Step 1. Installing Ubuntu on a VM.
<p>The VM was given 6GB of RAM, 70GB of fixed storage (There appeared to be problems using a dynamic storage type) and 2 CPUs.</p>
<p>The task requires as much hardware resources as possible, so with the most possible amount of 6/8GB of RAM it still took quite long to complete the operation</p>
<img src="https://github.com/Ismail11270/docker-tensorflow/blob/master/images/vm-sh.png" height=350px width=500x/>
------
## Step 2. Docker Installation. You can install docker manually following the [official docker manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/) automatically by completing the following two steps.
- Step 1. The first command will run the script that will load a docker installation script from https://get.docker.com/ and execute it.
  
  ```console
  sh docker-install.sh
  ```
  
  
- Step 2. This command will add current user to docker group.
  ```console
  sudo usermod -aG docker ${USER}
  ```
------
## Step 3. Setup and run docker container.
- Step 1. Build the docker image from the prepared Dockerfile and save it with "jupyter" tag. The dockerfile is based on tensorflow/notebook image with an addition tensorflow-hub and other components necessary to run tensorflow with Jupyter notebook. Then the [Tensorflow Hub](https://github.com/tensorflow/hub.git) is cloned into the container.

  ```console
  docker build -t jupyter . 
  ```
- Step 2. Run the docker container named "jupyter" on port 8888. 
  ```console
  docker run -p 8888:8888 jupyter
  ```
 - Step 3. Use the given link to access the notebook.
------
## Step 4. Run the object detection example with a desired image.
- Navigate to the examples/colab and select the image-detection example and run. Change the image source to desired one.

# Examplary results:

##  Image used for detection
  <img src="https://github.com/Ismail11270/docker-tensorflow/blob/master/images/image2undected.jpg?raw=true"/>
  
##  Result of detection
  <img src="https://github.com/Ismail11270/docker-tensorflow/blob/master/images/image2detected.png?raw=true"/>
  
# Conclusion
  <p>It's well easily noticed that the algorithm was easily able to correctly detect most of the objects on the image including such insignificant ones as wheels and a tree in the background, which presents all the power of tensorflow.</p> 
  <p>Being familiar with docker and some of its features, I find its usage for this task (Just to run a tensorflow example) quite redundant but on the other hand providing a good introduction into it.</p> 
  <p>The usage of jupyter notebook allowed a much better understanding of the algorithm having it seperated into steps, and being able to execute only the parts of the algorithm that need to be.</p>
  
## Source Code:
------
### docker-install.sh
  ```console
    
  #!/bin/sh

  sudo apt install curl -y
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  ```
------
### Dockerfile
  ```console
  FROM jupyter/tensorflow-notebook

  USER root

  RUN apt update
  RUN pip install pillow tf-nightly-gpu-2.0-preview tensorflow-hub
  RUN git clone https://github.com/tensorflow/hub.git

  EXPOSE 8888

  # Switch back to jovyan(Jupyter Notebook User) to avoid accidental container runs as root.
  USER $NB_UID

  CMD jupyter notebook
  ```





