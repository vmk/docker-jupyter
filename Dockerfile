FROM jupyter/all-spark-notebook

USER root

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 32g > spark-defaults.conf

USER jovyan

RUN cd /home/jovyan/work && \
    mkdir notebook_data && \
    cd notebook_data && \
    wget -O notebook_data.zip https://www.dropbox.com/sh/hln1oqxqbhux51e/AAA8AA6CONohR2_GvarRby7Ra?dl=1 && \
    unzip notebook_data.zip; exit 0 
    
RUN cd /home/jovyan/work && \
    git clone https://github.com/vmk/notebooks

# Install Python 2 packages
RUN conda install --name python2 \
    'nltk=3.1*' \
    && conda clean -yt

USER root

RUN /opt/conda/envs/python2/bin/python2 -m nltk.downloader -d /usr/local/share/nltk_data all

