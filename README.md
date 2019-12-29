# Docker Installation

- Step 1
  ```console
  sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
  ```
  
- Step 2
  ```console
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  ```
  
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
  sudo apt-get update
  
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  
  sudo usermod -aG docker ${USER}

# Running the Notebook

- docker build -t jupyter . 
- docker run -p 8888:8888 jupyter

