# Docker Installation

- Step 1
  ```console
  sh docker-install.sh
  ```
  
- Step 2
  ```console
  sudo usermod -aG docker ${USER}
  ```
  
------

# Running the Notebook

- docker build -t jupyter . 
- docker run -p 8888:8888 jupyter

------

# Object Detection example:

##  Image used for detection
  <img src="https://github.com/Ismail11270/docker-tensorflow/blob/master/images/image2undected.jpg?raw=true"/>
  
##  Result of detection
  <img src="https://github.com/Ismail11270/docker-tensorflow/blob/master/images/image2detected.png?raw=true"/>
  
