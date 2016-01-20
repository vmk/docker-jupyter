FROM jupyter/all-spark-notebook

USER root

RUN cd /usr/local/spark/conf/ && \
    echo spark.driver.memory 16g > spark-defaults.conf

USER jovyan

ENV PASSWORD 'spark@surfsara'

USER root

