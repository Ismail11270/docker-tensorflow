# Docker Installation

- Step 1
  ```console
  sh docker-install.sh
  ```
  
- Step 2
  ```console
  sudo usermod -aG docker ${USER}
  ```

# Running the Notebook

- docker build -t jupyter . 
- docker run -p 8888:8888 jupyter
