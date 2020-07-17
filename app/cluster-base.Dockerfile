ARG debian_buster_image_tag=8-jre-slim
FROM openjdk:${debian_buster_image_tag}

ARG shared_workspace=/opt/workspace
ARG spark_version=3.0.0

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 wget && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/list/*

ENV SHARED_WORKSPACE=${shared_workspace}
ENV SPARK_VERSION=${spark_version}

VOLUME ${shared_workspace}
CMD ["bash"]