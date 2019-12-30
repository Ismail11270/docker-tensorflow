FROM jupyter/tensorflow-notebook

USER root

RUN apt update && apt install git -y
RUN pip install pillow tf-nightly-gpu-2.0-preview tensorflow-hub

RUN git clone https://github.com/tensorflow/hub.git

EXPOSE 8888

CMD jupyter notebook --allow-root
