#!/bin/bash

SPARK_VERSION="3.0.0"
HADOOP_VERSION="2.7"
JUPYTERLAB_VERSION="2.1.5"

docker build --build-arg spark_version="${SPARK_VERSION}" -f cluster-base.Dockerfile -t cluster-base .
docker build --build-arg hadoop_version="${HADOOP_VERSION}" -f spark-base.Dockerfile -t spark-base .
docker build -f spark-master.Dockerfile -t spark-master .
docker build -f spark-worker.Dockerfile -t spark-worker .
docker build --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" -f jupyterlab.Dockerfile -t jupyterlab .