FROM jupyter/tensorflow-notebook

USER root

RUN apt update
RUN pip install pillow tf-nightly-gpu-2.0-preview tensorflow-hub
RUN git clone https://github.com/tensorflow/hub.git

EXPOSE 8888

# Switch back to jovyan(Jupyter Notebook User) to avoid accidental container runs as root.
USER $NB_UID

CMD jupyter notebook
